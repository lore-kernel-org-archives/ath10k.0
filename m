Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXQ5P-0005tK-FR
 for ath10k@lists.infradead.org; Tue, 08 Apr 2014 07:04:48 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 2/2] ath10k: refactor radar detection code
References: <1396337123-12622-1-git-send-email-michal.kazior@tieto.com>
 <1396610926-5787-1-git-send-email-michal.kazior@tieto.com>
 <1396610926-5787-3-git-send-email-michal.kazior@tieto.com>
 <87bnwdnslk.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=-vrJ_tize+uwCp5jgM7pvPZ0s9bGUK42Ko1TCHzmfzg@mail.gmail.com>
Date: Tue, 8 Apr 2014 10:04:05 +0300
In-Reply-To: <CA+BoTQ=-vrJ_tize+uwCp5jgM7pvPZ0s9bGUK42Ko1TCHzmfzg@mail.gmail.com>
 (Michal Kazior's message of "Tue, 8 Apr 2014 08:32:58 +0200")
Message-ID: <87fvlomhei.fsf@kamboji.qca.qualcomm.com>
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

>> Even though this is correct, I think it's still a bit evil. For example,
>> I missed '!' the first time I looked at this. Even this is a line
>> longer, I think it would be easier to read:
>>
>> WARN_ON(ar->num_started_vdevs == 0);
>>
>> if (ar->num_started_vdevs != 0) {
>>         ...
>> }
>
> Sound reasonably.

I changed it like this now:

--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -878,7 +878,9 @@ static int ath10k_vdev_stop(struct ath10k_vif *arvif)
                return ret;
        }
 
-       if (!WARN_ON(ar->num_started_vdevs == 0)) {
+       WARN_ON(ar->num_started_vdevs == 0);
+
+       if (ar->num_started_vdevs != 0) {
                ar->num_started_vdevs--;
                ath10k_recalc_radar_detection(ar);

Full patch here:

https://github.com/kvalo/ath/commit/0d57ff8b99539895c5a3714d7ecd80a58b6a8928

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
