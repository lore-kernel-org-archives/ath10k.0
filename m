Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0cUE-0006Mg-4A
 for ath10k@lists.infradead.org; Mon, 15 Dec 2014 20:43:23 +0000
Message-ID: <548F47D1.8080502@openwrt.org>
Date: Mon, 15 Dec 2014 21:42:57 +0100
From: Felix Fietkau <nbd@openwrt.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ath: fix incorrect PPB on FCC radar type 5
References: <1418669734-12921-1-git-send-email-poh@qca.qualcomm.com>
In-Reply-To: <1418669734-12921-1-git-send-email-poh@qca.qualcomm.com>
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
To: Peter Oh <poh@qca.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 2014-12-15 19:55, Peter Oh wrote:
> The minimum number of pulses per burst on FCC radar type 5 is 1.
> Use this number for correct radar detection.
> 
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
> ---
>  drivers/net/wireless/ath/dfs_pattern_detector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/dfs_pattern_detector.c b/drivers/net/wireless/ath/dfs_pattern_detector.c
> index cfd0554..3d57f87 100644
> --- a/drivers/net/wireless/ath/dfs_pattern_detector.c
> +++ b/drivers/net/wireless/ath/dfs_pattern_detector.c
> @@ -86,7 +86,7 @@ static const struct radar_detector_specs fcc_radar_ref_types[] = {
>  	FCC_PATTERN(1, 0, 5, 150, 230, 1, 23),
>  	FCC_PATTERN(2, 6, 10, 200, 500, 1, 16),
>  	FCC_PATTERN(3, 11, 20, 200, 500, 1, 12),
> -	FCC_PATTERN(4, 50, 100, 1000, 2000, 1, 20),
> +	FCC_PATTERN(4, 50, 100, 1000, 2000, 1, 1),
Won't that significantly increase the false positive rate?
Here's the previous change on that pattern:

commit 562930f8baee7a1cb5b9f382b4338c9b6fbf1139
Author: Vivek Natarajan <nataraja@qti.qualcomm.com>
Date:   Mon Nov 24 17:26:22 2014 +0530

    ath: Fix a false radar detection pattern
    
    For FCC and JP, in one of the radar patterns, PPB and PRF seems to be
    interchanged leading to frequent incorrect radar detections.
    
    Signed-off-by: Vivek Natarajan <nataraja@qti.qualcomm.com>
    Signed-off-by: John W. Linville <linville@tuxdriver.com>

diff --git a/drivers/net/wireless/ath/dfs_pattern_detector.c b/drivers/net/wireless/ath/dfs_pattern_detector.c
index 650be79..cfd0554 100644
--- a/drivers/net/wireless/ath/dfs_pattern_detector.c
+++ b/drivers/net/wireless/ath/dfs_pattern_detector.c
@@ -86,7 +86,7 @@ static const struct radar_detector_specs fcc_radar_ref_types[] = {
        FCC_PATTERN(1, 0, 5, 150, 230, 1, 23),
        FCC_PATTERN(2, 6, 10, 200, 500, 1, 16),
        FCC_PATTERN(3, 11, 20, 200, 500, 1, 12),
-       FCC_PATTERN(4, 50, 100, 1000, 2000, 20, 1),
+       FCC_PATTERN(4, 50, 100, 1000, 2000, 1, 20),
        FCC_PATTERN(5, 0, 1, 333, 333, 1, 9),
 };
 
@@ -105,7 +105,7 @@ static const struct radar_detector_specs jp_radar_ref_types[] = {
        JP_PATTERN(4, 0, 5, 150, 230, 1, 23),
        JP_PATTERN(5, 6, 10, 200, 500, 1, 16),
        JP_PATTERN(6, 11, 20, 200, 500, 1, 12),
-       JP_PATTERN(7, 50, 100, 1000, 2000, 20, 1),
+       JP_PATTERN(7, 50, 100, 1000, 2000, 1, 20),
        JP_PATTERN(5, 0, 1, 333, 333, 1, 9),
 };

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
