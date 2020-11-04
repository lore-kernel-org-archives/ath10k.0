Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka7Qg-0000bw-0i
 for ath10k@lists.infradead.org; Wed, 04 Nov 2020 01:17:39 +0000
Received: by mail-ot1-x342.google.com with SMTP id k3so5997318otp.12
 for <ath10k@lists.infradead.org>; Tue, 03 Nov 2020 17:17:35 -0800 (PST)
MIME-Version: 1.0
References: <20201030205639.1452712-1-kuabhs@chromium.org>
 <20201031024631.1528113-1-kuabhs@chromium.org>
 <e5302eb0b20339d3f6544652e4034993@codeaurora.org>
 <aba43fb268fe29aecf84bf7e68629dc0de28d0ad.camel@sipsolutions.net>
In-Reply-To: <aba43fb268fe29aecf84bf7e68629dc0de28d0ad.camel@sipsolutions.net>
From: Abhishek Kumar <kuabhs@google.com>
Date: Tue, 3 Nov 2020 17:17:22 -0800
Message-ID: <CAB5ih=PtneRW+sU9KbPNgEM8GvPA1rfa87M41fsL=y=VP71Y5Q@mail.gmail.com>
Subject: Re: [RFC 1/2] nl80211: add common API to configure SAR power
 limitations.
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Abhishek Kumar <kuabhs@chromium.org>, briannorris@chromium.org, Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org, Doug Anderson <dianders@chromium.org>, ath10k@lists.infradead.org

On Tue, Nov 3, 2020 at 5:15 AM Johannes Berg <johannes@sipsolutions.net> wrote:
>
> On Tue, 2020-11-03 at 10:34 +0800, Carl Huang wrote:
> > On 2020-10-31 10:46, Abhishek Kumar wrote:
> > > From: kuabhs@chromium.org
> > >
> > > There are few more additional comments here.
> > > > + * @NL80211_CMD_SET_SAR_SPECS: SAR power limitation configuration is
> > > > + *     passed using %NL80211_ATTR_SAR_SPEC.
> > > > + *
> > >
> > > This command requires NL80211_ATTR_IFINDEX, probably should be better
> > > to add
> > > this in the comment ?
> > >
> > Per Johannes's comments, this explicit index is not required. Are you
> > fine with it?
> >
> > Instead, user-space application records the array index when querying
> > the SAR
> > capability. When set, the nested array index will be used to set the
> > power.
> > This requires user-space has a strict mapping of index. and
> > NL80211_ATTR_IFINDEX
> > is to be removed.
>
> Wait, what? The IFINDEX is still required, that identifies the interface
> - though it probably shouldn't be required, this should be per wiphy, so
> you could also use ATTR_WIPHY_IDX?
>
> You're thinking of ... something
> else. NL80211_SAR_ATTR_SPECS_FREQ_RANGE_INDEX perhaps?

Yes, probably the index mapping that you are talking about is using
NL80211_SAR_ATTR_SPECS_FREQ_RANGE_INDEX .

I think Johannes has already covered most of the comments. I have one
last one  mentioned below.

> +nl80211_put_sar_specs(struct cfg80211_registered_device *rdev,
> +                     struct sk_buff *msg)
> +{
> +       struct nlattr *sar_capa, *specs, *sub_freq_range;
> +       u8  num_freq_ranges;
> +       int i;
> +
> +       if (!rdev->wiphy.sar_capa)
> +               return 0;
> +
> +       num_freq_ranges = rdev->wiphy.sar_capa->num_freq_ranges;
> +
> +       sar_capa = nla_nest_start(msg, NL80211_ATTR_SAR_SPEC);
> +       if (!sar_capa)
> +               return -ENOSPC;
> +
> +       if (nla_put_u16(msg, NL80211_SAR_ATTR_TYPE, rdev->wiphy.sar_capa->type))
> +               goto fail;

The nla_put_u16 NL80211_SAR_ATTR_TYPE here uses u16 whereas in the to
get this property below it uses nla_get_u32 .  I think this should be
consistent ?

> +       if (!tb[NL80211_SAR_ATTR_TYPE])
> +               return -EINVAL;
> +
> +       type = nla_get_u32(tb[NL80211_SAR_ATTR_TYPE]);
> +
> +       if (!tb[NL80211_SAR_ATTR_SPECS])
> +               return -EINVAL;

As mentioned above the get and put for NL80211_SAR_ATTR_TYPE is not consistent.

-Abhishek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
