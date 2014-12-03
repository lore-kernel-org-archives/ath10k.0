Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xw3UJ-0004m5-BQ
 for ath10k@lists.infradead.org; Wed, 03 Dec 2014 06:32:35 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 2/7] ath10k: add ATH10K_FW_IE_WMI_OP_VERSION
References: <20141201144400.18248.62714.stgit@potku.adurom.net>
 <20141201144507.18248.9856.stgit@potku.adurom.net>
 <CA+BoTQm+JqCEXPQ4njxGvm-v_Typ0BDTK5g8627O_-gKiTWHZw@mail.gmail.com>
Date: Wed, 3 Dec 2014 08:32:09 +0200
In-Reply-To: <CA+BoTQm+JqCEXPQ4njxGvm-v_Typ0BDTK5g8627O_-gKiTWHZw@mail.gmail.com>
 (Michal Kazior's message of "Tue, 2 Dec 2014 12:51:58 +0100")
Message-ID: <87r3whjlau.fsf@kamboji.qca.qualcomm.com>
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
>> @@ -562,6 +562,17 @@ static int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name)
>>                         ar->otp_len = ie_len;
>>
>>                         break;
>> +               case ATH10K_FW_IE_WMI_OP_VERSION:
>> +                       if (ie_len != sizeof(u32))
>> +                               break;
>> +
>> +                       version = (__le32 *)data;
>> +
>> +                       ar->wmi.op_version = le32_to_cpup(version);
>> +
>> +                       ath10k_dbg(ar, ATH10K_DBG_BOOT, "found fw ie wmi op version %d\n",
>> +                                  ar->wmi.op_version);
>
> Hmm.. wouldn't it make sense to have a ATH10K_FW_WMI_OP_VERSION_MAX
> (or _LAST) and verify if the IE value doesn't exceed the last known
> value? This way switch()es won't need default handler by design and
> thus we'll get the benefit of compiler telling us about unhandled
> cases when we add new enums.

A good idea, I'll add that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
