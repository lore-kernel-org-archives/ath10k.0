Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZwAI-0003ix-Pe
 for ath10k@lists.infradead.org; Tue, 03 Nov 2020 13:16:00 +0000
Message-ID: <aba43fb268fe29aecf84bf7e68629dc0de28d0ad.camel@sipsolutions.net>
Subject: Re: [RFC 1/2] nl80211: add common API to configure SAR power
 limitations.
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 03 Nov 2020 14:15:34 +0100
In-Reply-To: <e5302eb0b20339d3f6544652e4034993@codeaurora.org>
References: <20201030205639.1452712-1-kuabhs@chromium.org>
 <20201031024631.1528113-1-kuabhs@chromium.org>
 <e5302eb0b20339d3f6544652e4034993@codeaurora.org>
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
To: Carl Huang <cjhuang@codeaurora.org>, Abhishek Kumar <kuabhs@chromium.org>
Cc: briannorris@chromium.org, linux-wireless@vger.kernel.org, dianders@chromium.org, ath10k@lists.infradead.org

On Tue, 2020-11-03 at 10:34 +0800, Carl Huang wrote:
> On 2020-10-31 10:46, Abhishek Kumar wrote:
> > From: kuabhs@chromium.org
> > 
> > There are few more additional comments here.
> > > + * @NL80211_CMD_SET_SAR_SPECS: SAR power limitation configuration is
> > > + *     passed using %NL80211_ATTR_SAR_SPEC.
> > > + *
> > 
> > This command requires NL80211_ATTR_IFINDEX, probably should be better 
> > to add
> > this in the comment ?
> > 
> Per Johannes's comments, this explicit index is not required. Are you 
> fine with it?
> 
> Instead, user-space application records the array index when querying 
> the SAR
> capability. When set, the nested array index will be used to set the 
> power.
> This requires user-space has a strict mapping of index. and 
> NL80211_ATTR_IFINDEX
> is to be removed.

Wait, what? The IFINDEX is still required, that identifies the interface
- though it probably shouldn't be required, this should be per wiphy, so
you could also use ATTR_WIPHY_IDX?

You're thinking of ... something
else. NL80211_SAR_ATTR_SPECS_FREQ_RANGE_INDEX perhaps?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
