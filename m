Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x229.google.com ([2607:f8b0:4002:c07::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMukl-0000DC-Nz
 for ath10k@lists.infradead.org; Sat, 23 Jan 2016 09:45:08 +0000
Received: by mail-yk0-x229.google.com with SMTP id k129so114174052yke.0
 for <ath10k@lists.infradead.org>; Sat, 23 Jan 2016 01:44:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56A2C77E.4070803@codeaurora.org>
References: <CANCHnQoZJ2Oy7VdCCe-Lv=V0Z_yp86m2z4anG-G=QbZxi69suA@mail.gmail.com>
 <CANCHnQp5yF9O3Wo72-FJjDVYFouPj-YoXt+6RmLWTvYavomvMg@mail.gmail.com>
 <CANCHnQryCaT9-qVfVrGO8Y8=cK_4pxbBArtfRQewp_gYA7hMHQ@mail.gmail.com>
 <56A2C77E.4070803@codeaurora.org>
Date: Sat, 23 Jan 2016 10:44:46 +0100
Message-ID: <CANCHnQqZppUUDhCXEf5wQ=BkCs5MYnEZuZ4esvx29Lj7Ym=t5Q@mail.gmail.com>
Subject: Re: Mesh on ath10k drops all packets
From: Jeroen Roovers <jeroen.roovers@airfi.aero>
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
To: Peter Oh <poh@codeaurora.org>
Cc: ath10k@lists.infradead.org

On 23 January 2016 at 01:21, Peter Oh <poh@codeaurora.org> wrote:

> Do you have "arvif->vif->type != NL80211_IFTYPE_MESH_POINT" in your code?
>
> static int ath10k_install_peer_wep_keys(struct ath10k_vif *arvif,
>                     const u8 *addr)
> {
>     if (WARN_ON(arvif->vif->type != NL80211_IFTYPE_AP &&
>             arvif->vif->type != NL80211_IFTYPE_ADHOC &&
>             arvif->vif->type != NL80211_IFTYPE_MESH_POINT))
>         return -EINVAL;

I did not. When I add that, everything suddenly works as expected. Thanks!


Regards,
     jer

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
