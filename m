Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1duDOg-0003Tr-8z
 for ath10k@lists.infradead.org; Tue, 19 Sep 2017 07:56:48 +0000
Received: by mail-wm0-x22b.google.com with SMTP id 189so17093311wmh.1
 for <ath10k@lists.infradead.org>; Tue, 19 Sep 2017 00:56:25 -0700 (PDT)
Subject: Re: [TDLS PATCH V3 1/5] mac80211: Enable TDLS peer buffer STA feature
References: <TDLS for ath10k patchset v3>
 <1505790913-28377-1-git-send-email-yintang@qti.qualcomm.com>
 <1505790913-28377-2-git-send-email-yintang@qti.qualcomm.com>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <db428527-cb2b-5136-24c2-be2fca9e2407@broadcom.com>
Date: Tue, 19 Sep 2017 09:56:22 +0200
MIME-Version: 1.0
In-Reply-To: <1505790913-28377-2-git-send-email-yintang@qti.qualcomm.com>
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: yintang@qti.qualcomm.com, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 19-09-17 05:15, yintang@qti.qualcomm.com wrote:
> From: Yingying Tang <yintang@qti.qualcomm.com>
> 
> Enable TDLS peer buffer STA feature.
> Set extended capability bit to enable buffer STA when driver
> support it.
> 
> Signed-off-by: Yingying Tang <yintang@qti.qualcomm.com>
> ---
>   include/net/cfg80211.h |    3 +++
>   net/mac80211/tdls.c    |    5 ++++-
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
> index f12fa52..edefc25 100644
> --- a/include/net/cfg80211.h
> +++ b/include/net/cfg80211.h
> @@ -3249,6 +3249,8 @@ struct cfg80211_ops {
>    *	beaconing mode (AP, IBSS, Mesh, ...).
>    * @WIPHY_FLAG_HAS_STATIC_WEP: The device supports static WEP key installation
>    *	before connection.
> + * @WIPHY_FLAG_SUPPORT_TDLS_BUFFER_STA: Device support buffer STA when TDLS is
> + *	established.

If I am not mistaken no new wiphy flags are supposed to be added. 
Although this might be something not reported to user-space, right? Have 
a look at struct wiphy::ext_features.

Regards,
Arend

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
