Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk1Be-00071S-2H
 for ath10k@lists.infradead.org; Tue, 01 Dec 2020 08:39:02 +0000
Received: by mail-io1-xd43.google.com with SMTP id z136so799616iof.3
 for <ath10k@lists.infradead.org>; Tue, 01 Dec 2020 00:39:01 -0800 (PST)
MIME-Version: 1.0
References: <20201120085312.4355-1-cjhuang@codeaurora.org>
 <20201120085312.4355-3-cjhuang@codeaurora.org>
In-Reply-To: <20201120085312.4355-3-cjhuang@codeaurora.org>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Tue, 1 Dec 2020 00:38:49 -0800
Message-ID: <CACTWRwtMJEoDY3hZKYL-w4h0t85vMPpHktHJH8xt51i6EUu52Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mac80211: add ieee80211_set_sar_specs
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
To: Carl Huang <cjhuang@codeaurora.org>
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, ath10k <ath10k@lists.infradead.org>

Changes LGTM,
Reviewed-by: Abhishek Kumar <kuabhs@chromium.org>

Thanks
Abhishek

On Fri, Nov 20, 2020 at 12:54 AM Carl Huang <cjhuang@codeaurora.org> wrote:
>
> This change registers ieee80211_set_sar_specs to
> mac80211_config_ops, so cfg80211 can call it.
>
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> ---
> v2:
> - rebased on ToT
>
>  include/net/mac80211.h |  2 ++
>  net/mac80211/cfg.c     | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/include/net/mac80211.h b/include/net/mac80211.h
> index 05c7524..3576e34 100644
> --- a/include/net/mac80211.h
> +++ b/include/net/mac80211.h
> @@ -4197,6 +4197,8 @@ struct ieee80211_ops {
>                                    struct ieee80211_vif *vif);
>         void (*sta_set_4addr)(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
>                               struct ieee80211_sta *sta, bool enabled);
> +       int (*set_sar_specs)(struct ieee80211_hw *hw,
> +                            const struct cfg80211_sar_specs *sar);
>  };
>
>  /**
> diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
> index 7276e66a..f7ff35b 100644
> --- a/net/mac80211/cfg.c
> +++ b/net/mac80211/cfg.c
> @@ -4083,6 +4083,17 @@ static int ieee80211_reset_tid_config(struct wiphy *wiphy,
>         return ret;
>  }
>
> +static int ieee80211_set_sar_specs(struct wiphy *wiphy,
> +                                  struct cfg80211_sar_specs *sar)
> +{
> +       struct ieee80211_local *local = wiphy_priv(wiphy);
> +
> +       if (!local->ops->set_sar_specs)
> +               return -EOPNOTSUPP;
> +
> +       return local->ops->set_sar_specs(&local->hw, sar);
> +}
> +
>  const struct cfg80211_ops mac80211_config_ops = {
>         .add_virtual_intf = ieee80211_add_iface,
>         .del_virtual_intf = ieee80211_del_iface,
> @@ -4186,4 +4197,5 @@ const struct cfg80211_ops mac80211_config_ops = {
>         .probe_mesh_link = ieee80211_probe_mesh_link,
>         .set_tid_config = ieee80211_set_tid_config,
>         .reset_tid_config = ieee80211_reset_tid_config,
> +       .set_sar_specs = ieee80211_set_sar_specs,
>  };
> --
> 2.7.4
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
