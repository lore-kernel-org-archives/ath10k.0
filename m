Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x235.google.com ([2607:f8b0:400c:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBTOa-0007Up-B5
 for ath10k@lists.infradead.org; Thu, 06 Feb 2014 18:09:52 +0000
Received: by mail-vc0-f181.google.com with SMTP id ie18so1703459vcb.26
 for <ath10k@lists.infradead.org>; Thu, 06 Feb 2014 10:09:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1391676841-11107-1-git-send-email-michal.kazior@tieto.com>
References: <1391676841-11107-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 7 Feb 2014 02:09:30 +0800
Message-ID: <CAEFj984TssetDfG=3FnvZhJVxsoYKba+ppoV4nV=R9psfs5B8g@mail.gmail.com>
Subject: Re: [PATCH] ath10k: implement sta_rc_update()
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> @@ -3091,6 +3160,10 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
>                            "mac vdev %d peer create %pM (new sta) num_peers %d\n",
>                            arvif->vdev_id, sta->addr, ar->num_peers);
>
> +               memset(&arsta, 0, sizeof(*arsta));

Should be memset(arsta, 0, sizeof(*arsta)), right?

---
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
