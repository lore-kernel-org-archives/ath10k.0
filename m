Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaMu3-0002KM-Hk
 for ath10k@lists.infradead.org; Wed, 04 Nov 2020 17:49:00 +0000
Received: by mail-lf1-x143.google.com with SMTP id 141so28298814lfn.5
 for <ath10k@lists.infradead.org>; Wed, 04 Nov 2020 09:48:59 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id c17sm576644ljj.133.2020.11.04.09.48.56
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 09:48:57 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id s30so6008004lfc.4
 for <ath10k@lists.infradead.org>; Wed, 04 Nov 2020 09:48:56 -0800 (PST)
MIME-Version: 1.0
References: <1600753775-4745-1-git-send-email-cjhuang@codeaurora.org>
 <6649b0c2ff988c2ae8723ea633f86cc12da43d95.camel@sipsolutions.net>
 <d424aa0e80ac55e511ddb33b41d40fea@codeaurora.org>
In-Reply-To: <d424aa0e80ac55e511ddb33b41d40fea@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Wed, 4 Nov 2020 09:48:43 -0800
Message-ID: <CA+ASDXNAXo=p=_MbNXG+Mma37v5b6gAPySsXpNh6CC+L_gLnXQ@mail.gmail.com>
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
To: Carl Huang <cjhuang@codeaurora.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless <linux-wireless@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, ath10k <ath10k@lists.infradead.org>, Abhishek Kumar <kuabhs@google.com>

On Wed, Nov 4, 2020 at 12:44 AM Carl Huang <cjhuang@codeaurora.org> wrote:
> On 2020-09-28 20:36, Johannes Berg wrote:
> > On Tue, 2020-09-22 at 13:49 +0800, Carl Huang wrote:
> >> +struct cfg80211_sar_freq_ranges {
> >> +    u8 index;
> >
> > Does an index here make sense?
> >
> With agreement from Google, it's OK to remove it.

I'm not sure "Google" is the arbiter of the nl80211 API, even if we
are the current planned users ;)

But I think I agree with Johannes, that given the other plans (user
space must send all bands all the time; dropping the "apply to all
bands" support), an index isn't really necessary in either the user
space API or the internal representation handed down to drivers. All
bands should be specified, in order.

Brian

> >> +    u32 start_freq;
> >> +    u32 end_freq;
> >> +};

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
