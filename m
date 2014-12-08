Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XxsEY-0000Pp-Rk
 for ath10k@lists.infradead.org; Mon, 08 Dec 2014 06:55:51 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v4 8/8] ath10k: implement wmi-tlv backend
References: <20141203080803.31187.85059.stgit@potku.adurom.net>
 <20141203081132.31187.53311.stgit@potku.adurom.net>
 <CA+BoTQk=EHwqAT-VFeaQS5Q55HsiycwPfE9p-8dj6v8RZyNmsg@mail.gmail.com>
Date: Mon, 8 Dec 2014 08:54:56 +0200
In-Reply-To: <CA+BoTQk=EHwqAT-VFeaQS5Q55HsiycwPfE9p-8dj6v8RZyNmsg@mail.gmail.com>
 (Michal Kazior's message of "Wed, 3 Dec 2014 14:01:45 +0100")
Message-ID: <87oare4on3.fsf@kamboji.qca.qualcomm.com>
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

> On 3 December 2014 at 09:11, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> [...]
>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>> index 0f4369e4f358..815d6e27aa53 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -844,6 +844,10 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
>>                 ar->max_num_stations = TARGET_10X_NUM_STATIONS;
>>                 ar->htt.max_num_pending_tx = TARGET_10X_NUM_MSDU_DESC;
>>                 break;
>> +       case ATH10K_FW_WMI_OP_VERSION_TLV:
>> +               ar->max_num_peers = TARGET_TLV_NUM_PEERS;
>> +               ar->max_num_stations = TARGET_TLV_NUM_STATIONS;
>> +               ar->htt.max_num_pending_tx = TARGET_TLV_NUM_MSDU_DESC;
>
> Missing break?

Fixed by folding this:

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 5b33f01fcee5..577a3d76df22 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -919,6 +919,7 @@ static int ath10k_core_init_firmware_features(struct ath10k *ar)
                ar->max_num_peers = TARGET_TLV_NUM_PEERS;
                ar->max_num_stations = TARGET_TLV_NUM_STATIONS;
                ar->htt.max_num_pending_tx = TARGET_TLV_NUM_MSDU_DESC;
+               break;
        case ATH10K_FW_WMI_OP_VERSION_UNSET:
        case ATH10K_FW_WMI_OP_VERSION_MAX:
                WARN_ON(1);


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
