Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xvhai-0000oB-QH
 for ath10k@lists.infradead.org; Tue, 02 Dec 2014 07:09:45 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 1/7] ath10k: create ath10k_core_init_features()
References: <20141201144400.18248.62714.stgit@potku.adurom.net>
 <20141201144458.18248.28568.stgit@potku.adurom.net>
 <CA+BoTQkrqeWcr2vrd-b18HezZhyBkfvOYE3SgF39oYu54BX-Fw@mail.gmail.com>
Date: Tue, 2 Dec 2014 09:09:06 +0200
In-Reply-To: <CA+BoTQkrqeWcr2vrd-b18HezZhyBkfvOYE3SgF39oYu54BX-Fw@mail.gmail.com>
 (Michal Kazior's message of "Tue, 2 Dec 2014 07:58:09 +0100")
Message-ID: <87a936plyl.fsf@kamboji.qca.qualcomm.com>
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

> On 1 December 2014 at 15:44, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> [...]
>>  int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
>> @@ -1046,7 +1047,12 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
>>                 return ret;
>>         }
>>
>> -       ath10k_core_init_max_sta_count(ar);
>> +       ret = ath10k_core_init_firmware_features(ar);
>> +       if (ret) {
>> +               ath10k_err(ar, "fatal problem with firmware features: %d\n",
>> +                          ret);
>> +               return ret;
>
> I think you should call ath10k_core_free_firmware_files() and
> ath10k_hif_power_down() before returning (similar to how
> ath10k_core_start() failure is handled).

Indeed. I'll fix that in v4.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
