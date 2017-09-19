Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from lists.laptop.org ([18.85.44.157] helo=swan.laptop.org)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1du8vm-0008GY-M9
 for ath10k@lists.infradead.org; Tue, 19 Sep 2017 03:10:43 +0000
Date: Tue, 19 Sep 2017 13:01:13 +1000
From: James Cameron <quozl@laptop.org>
Subject: Re: [TDLS PATCH V2 1/5] mac80211: Enable TDLS peer buffer STA feature
Message-ID: <20170919030113.GO26927@us.netrek.org>
References: <1505789468-25330-1-git-send-email-yintang@qti.qualcomm.com>
 <1505789468-25330-2-git-send-email-yintang@qti.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1505789468-25330-2-git-send-email-yintang@qti.qualcomm.com>
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
To: yintang@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, Sep 19, 2017 at 10:51:04AM +0800, yintang@qti.qualcomm.com wrote:
> From: Yingying Tang <yintang@qti.qualcomm.com>
> 
> Enable TDLS peer buffer STA feature.
> Set extended capability bit to enable buffer STA when driver
> support it.
> 
> Signed-off-by: Yingying Tang <yintang@qti.qualcomm.com>
> ---
>  include/net/cfg80211.h |    3 +++
>  net/mac80211/tdls.c    |    5 ++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
> index f12fa52..edefc25 100644
> --- a/include/net/cfg80211.h
> +++ b/include/net/cfg80211.h
> @@ -3249,6 +3249,8 @@ struct cfg80211_ops {
>   *	beaconing mode (AP, IBSS, Mesh, ...).
>   * @WIPHY_FLAG_HAS_STATIC_WEP: The device supports static WEP key installation
>   *	before connection.
> + * @WIPHY_FLAG_SUPPORT_TDLS_BUFFER_ST: Device support buffer STA when TDLS is

"_ST:" should be "_STA:"

> + *	established.
>   */
>  enum wiphy_flags {
>  	/* use hole at 0 */
> @@ -3275,6 +3277,7 @@ enum wiphy_flags {
>  	WIPHY_FLAG_SUPPORTS_5_10_MHZ		= BIT(22),
>  	WIPHY_FLAG_HAS_CHANNEL_SWITCH		= BIT(23),
>  	WIPHY_FLAG_HAS_STATIC_WEP		= BIT(24),
> +	WIPHY_FLAG_SUPPORT_TDLS_BUFFER_STA      = BIT(25),
>  };
>  
>  /**
> [...]

-- 
James Cameron
http://quozl.netrek.org/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
