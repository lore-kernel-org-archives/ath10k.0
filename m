Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XxsMZ-0002w1-O7
 for ath10k@lists.infradead.org; Mon, 08 Dec 2014 07:04:08 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v4 6/8] ath10k: introduce wmi ops
References: <20141203080803.31187.85059.stgit@potku.adurom.net>
 <20141203081054.31187.10953.stgit@potku.adurom.net>
 <CA+BoTQ=MbCkF11QwqCGbtPm4veFKrUmN=3dQ_zK+APeWifCRPQ@mail.gmail.com>
Date: Mon, 8 Dec 2014 09:03:30 +0200
In-Reply-To: <CA+BoTQ=MbCkF11QwqCGbtPm4veFKrUmN=3dQ_zK+APeWifCRPQ@mail.gmail.com>
 (Michal Kazior's message of "Mon, 8 Dec 2014 07:51:28 +0100")
Message-ID: <87fvcq4o8t.fsf@kamboji.qca.qualcomm.com>
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
> [...]
>>  int ath10k_wmi_attach(struct ath10k *ar)
>>  {
>> -       if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
>> -               if (test_bit(ATH10K_FW_FEATURE_WMI_10_2, ar->fw_features))
>> -                       ar->wmi.cmd = &wmi_10_2_cmd_map;
>> -               else
>> -                       ar->wmi.cmd = &wmi_10x_cmd_map;
>> -
>> +       switch (ar->wmi.op_version) {
>> +       case ATH10K_FW_WMI_OP_VERSION_10_2:
>> +               ar->wmi.cmd = &wmi_10_2_cmd_map;
>> +               ar->wmi.ops = &wmi_10_2_ops;
>>                 ar->wmi.vdev_param = &wmi_10x_vdev_param_map;
>>                 ar->wmi.pdev_param = &wmi_10x_pdev_param_map;
>> -       } else {
>> +               break;
>> +       case ATH10K_FW_WMI_OP_VERSION_10_1:
>> +               ar->wmi.cmd = &wmi_10x_cmd_map;
>> +               ar->wmi.ops = &wmi_10_1_ops;
>> +               ar->wmi.vdev_param = &wmi_10x_vdev_param_map;
>> +               ar->wmi.pdev_param = &wmi_10x_pdev_param_map;
>> +               break;
>> +       case ATH10K_FW_WMI_OP_VERSION_MAIN:
>>                 ar->wmi.cmd = &wmi_cmd_map;
>> +               ar->wmi.ops = &wmi_ops;
>>                 ar->wmi.vdev_param = &wmi_vdev_param_map;
>>                 ar->wmi.pdev_param = &wmi_pdev_param_map;
>> +               break;
>> +       default:
>
> I think we don't need the `default` here now, do we? Instead _UNSET
> and _MAX should be handled.

Correct. I folded this change:

--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4786,7 +4786,8 @@ int ath10k_wmi_attach(struct ath10k *ar)
                ar->wmi.vdev_param = &wmi_vdev_param_map;
                ar->wmi.pdev_param = &wmi_pdev_param_map;
                break;
-       default:
+       case ATH10K_FW_WMI_OP_VERSION_UNSET:
+       case ATH10K_FW_WMI_OP_VERSION_MAX:
                ath10k_err(ar, "unsupported WMI op version: %d\n",
                           ar->wmi.op_version);
                return -EINVAL;

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
