Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XxsHa-000190-KK
 for ath10k@lists.infradead.org; Mon, 08 Dec 2014 06:58:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v4 6/8] ath10k: introduce wmi ops
References: <20141203080803.31187.85059.stgit@potku.adurom.net>
 <20141203081054.31187.10953.stgit@potku.adurom.net>
 <CA+BoTQmEG2UQdp=42qHMMQDE04xm2Xnss4su0TNav1Z_RQEX3Q@mail.gmail.com>
Date: Mon, 8 Dec 2014 08:58:11 +0200
In-Reply-To: <CA+BoTQmEG2UQdp=42qHMMQDE04xm2Xnss4su0TNav1Z_RQEX3Q@mail.gmail.com>
 (Michal Kazior's message of "Wed, 3 Dec 2014 13:59:59 +0100")
Message-ID: <87k3224oho.fsf@kamboji.qca.qualcomm.com>
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

> On 3 December 2014 at 09:10, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
>> --- a/drivers/net/wireless/ath/ath10k/testmode.c
>> +++ b/drivers/net/wireless/ath/ath10k/testmode.c
>> @@ -187,13 +187,14 @@ static int ath10k_tm_cmd_utf_start(struct ath10k *ar, struct nlattr *tb[])
>>
>>         memcpy(ar->testmode.orig_fw_features, ar->fw_features,
>>                sizeof(ar->fw_features));
>> +       ar->testmode.orig_wmi_op_version = ar->wmi.op_version;
>>
>>         /* utf.bin firmware image does not advertise firmware features. Do
>>          * an ugly hack where we force the firmware features so that wmi.c
>>          * will use the correct WMI interface.
>>          */
>>         memset(ar->fw_features, 0, sizeof(ar->fw_features));
>> -       __set_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features);
>> +       ar->wmi.op_version = ATH10K_FW_WMI_OP_VERSION_10_1;
>>
>>         ret = ath10k_hif_power_up(ar);
>>         if (ret) {
>> @@ -224,6 +225,7 @@ err_fw_features:
>>         /* return the original firmware features */
>>         memcpy(ar->fw_features, ar->testmode.orig_fw_features,
>>                sizeof(ar->fw_features));
>> +       ar->wmi.op_version = ar->testmode.orig_wmi_op_version;
>>
>>         release_firmware(ar->testmode.utf);
>>         ar->testmode.utf = NULL;
>> @@ -250,6 +252,7 @@ static void __ath10k_tm_cmd_utf_stop(struct ath10k *ar)
>>         /* return the original firmware features */
>>         memcpy(ar->fw_features, ar->testmode.orig_fw_features,
>>                sizeof(ar->fw_features));
>> +       ar->wmi.op_version = ar->testmode.orig_wmi_op_version;
>>
>>         release_firmware(ar->testmode.utf);
>>         ar->testmode.utf = NULL;
>
> Does testmode stuff really belong to this patchset? Shouldn't this be
> done in the one that introduces WMI OP version?

Actually the WMI code in wmi.c starts using ar->wmi.op_version only in
this patch. Before this patch ATH10K_FW_FEATURE_WMI_* flags are heavily
used in wmi.c. So that's why the change is made in this patch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
