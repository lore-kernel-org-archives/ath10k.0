Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xw3SR-0004IS-43
 for ath10k@lists.infradead.org; Wed, 03 Dec 2014 06:30:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 2/7] ath10k: add ATH10K_FW_IE_WMI_OP_VERSION
References: <20141201144400.18248.62714.stgit@potku.adurom.net>
 <20141201144507.18248.9856.stgit@potku.adurom.net>
 <CA+BoTQkXnHnMsLvRt2PnnDCAv8P8gDsJTLNFPmf+CNaDX0frfg@mail.gmail.com>
Date: Wed, 3 Dec 2014 08:30:05 +0200
In-Reply-To: <CA+BoTQkXnHnMsLvRt2PnnDCAv8P8gDsJTLNFPmf+CNaDX0frfg@mail.gmail.com>
 (Michal Kazior's message of "Tue, 2 Dec 2014 13:16:33 +0100")
Message-ID: <87vbltjlea.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 1 December 2014 at 15:45, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> [...]
>> @@ -801,11 +812,24 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
>>         }
>>
>>         if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
>> -               ar->max_num_peers = TARGET_10X_NUM_PEERS;
>> -               ar->max_num_stations = TARGET_10X_NUM_STATIONS;
>> +               if (test_bit(ATH10K_FW_FEATURE_WMI_10_2, ar->fw_features))
>> +                       ar->wmi.op_version = ATH10K_FW_WMI_OP_VERSION_10_2;
>> +               else
>> +                       ar->wmi.op_version = ATH10K_FW_WMI_OP_VERSION_10_1;
>>         } else {
>> +               ar->wmi.op_version = ATH10K_FW_WMI_OP_VERSION_MAIN;
>> +       }
>
> You always overwrite ar->wmi.op_version with MAIN if it's not 10.x
> which means TLV is/wiil be effectively overwritten.
>
> Perhaps the op_version enum values should start with 1 so that 0 can
> be used as "unset" and only in that case should the above fallback be
> attempted.

That's a good idea, I'll add that.

> Also, I think it might be a good idea to reset ar->wmi.op_version in
> ath10k_core_fetch_firmware_api_n (and api_1 as well) so that if any
> attempt fails (e.g. due to IE binary corruption) ar->wmi.op_version
> isn't propagated/left unchanged to another fw API attempt.

Yeah, we should do that. But that's an existing problem, not something
introduced by this patchset (we have the same problem with
ar->fw_features) . So I would like to fix that later and added it to the
TODO list:

http://wireless.kernel.org/en/users/Drivers/ath10k/todo

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
