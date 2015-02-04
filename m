Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIvPX-0004Pq-1Q
 for ath10k@lists.infradead.org; Wed, 04 Feb 2015 08:34:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/8] ath10k: fix spelling mistakes and add details to mac
 logging.
References: <1421087564-10384-1-git-send-email-greearb@candelatech.com>
 <1421087564-10384-3-git-send-email-greearb@candelatech.com>
Date: Wed, 4 Feb 2015 10:33:37 +0200
In-Reply-To: <1421087564-10384-3-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Mon, 12 Jan 2015 10:32:39
 -0800")
Message-ID: <87d25qulcu.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> A bit of general cleanup to make debug messages more useful.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

[...]

> -		ath10k_warn(ar, "failed to synchronise monitor vdev %i: %d\n",
> +		ath10k_warn(ar, "failed to synchronize monitor vdev %i: %d (stop)\n",

Hehe, spelling fixes? You know not everyone speak "American" ;)

Anyway, I changed the patch in pending branch to follow the style with
other similar warning messages:

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 40c666615993..f4ab3d0a5fa0 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -608,7 +608,7 @@ static int ath10k_monitor_vdev_start(struct ath10k *ar, int vdev_id)
 
        ret = ath10k_vdev_setup_sync(ar);
        if (ret) {
-               ath10k_warn(ar, "failed to synchronize setup for monitor vdev %i: %d (start)\n",
+               ath10k_warn(ar, "failed to synchronize setup for monitor vdev %i start: %d\n",
                            vdev_id, ret);
                return ret;
        }
@@ -655,7 +655,7 @@ static int ath10k_monitor_vdev_stop(struct ath10k *ar)
 
        ret = ath10k_vdev_setup_sync(ar);
        if (ret)
-               ath10k_warn(ar, "failed to synchronize monitor vdev %i: %d (stop)\n",
+               ath10k_warn(ar, "failed to synchronize monitor vdev %i stop: %d\n",
                            ar->monitor_vdev_id, ret);
 
        ath10k_dbg(ar, ATH10K_DBG_MAC, "mac monitor vdev %i stopped\n",
@@ -924,8 +924,9 @@ static int ath10k_vdev_start_restart(struct ath10k_vif *arvif, bool restart)
 
        ret = ath10k_vdev_setup_sync(ar);
        if (ret) {
-               ath10k_warn(ar, "failed to synchronize setup for vdev %i: %d (restart %d)\n",
-                           arg.vdev_id, ret, restart);
+               ath10k_warn(ar,
+                           "failed to synchronize setup for vdev %i restart %d: %d\n",
+                           arg.vdev_id, restart, ret);
                return ret;
        }
 
@@ -963,7 +964,7 @@ static int ath10k_vdev_stop(struct ath10k_vif *arvif)
 
        ret = ath10k_vdev_setup_sync(ar);
        if (ret) {
-               ath10k_warn(ar, "failed to synchronize setup for vdev %i: %d (stop)\n",
+               ath10k_warn(ar, "failed to synchronize setup for vdev %i stop: %d\n",
                            arvif->vdev_id, ret);
                return ret;
        }


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
