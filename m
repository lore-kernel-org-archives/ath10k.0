Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg0QX-0007vc-7s
 for ath10k@lists.infradead.org; Fri, 20 Nov 2020 07:01:50 +0000
MIME-Version: 1.0
Date: Fri, 20 Nov 2020 15:01:44 +0800
From: Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH 1/3] nl80211: add common API to configure SAR power
 limitations.
In-Reply-To: <CACTWRwtcd2rdE-JQTh0t=Xwu9Vv-2He2M4wVDXbbiV1FOyNq7g@mail.gmail.com>
References: <20201106100708.4609-1-cjhuang@codeaurora.org>
 <20201106100708.4609-2-cjhuang@codeaurora.org>
 <64e072a168c12f58847a5ee16bfdb7e47576284f.camel@sipsolutions.net>
 <00c810b30b91397e562ca54475940afc@codeaurora.org>
 <CACTWRwtcd2rdE-JQTh0t=Xwu9Vv-2He2M4wVDXbbiV1FOyNq7g@mail.gmail.com>
Message-ID: <02fee7badc98864c5a51f91604f7a416@codeaurora.org>
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
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, ath10k <ath10k@lists.infradead.org>, Johannes Berg <johannes@sipsolutions.net>, kuabhs@google.com

On 2020-11-20 04:25, Abhishek Kumar wrote:
> Hi,
> 
> Johannes has some good comments, apart for that I have some nits.
>> > And wait, I thought we agreed to remove the index? Now I'm confused.
>> >
>> Using index in SET operation doesn't add burden to userspace and 
>> kernel,
>> but it provides some flexibility so userspace can skip some certain
>> ranges.
> 
> I agree with Carl's comment, we do need the frequency index. If the
> frequency index is provided, then the order is not important which
> makes the data more clear or the set_sar_spec function needs to parse
> the frequency ranges (and ofcourse userspace has to populate that as
> well). If the frequency index is not provided, then the driver has to
> assume that the userspace is not making any error in mapping of the
> power and desired frequency.
> Other reason is, might be a bit unlikely, but if in future there are
> new subbands, then it gives a flexibility to the userspace to
> explicitly provide the band for which it needs to set the power for.
> 
>> + *     used with %NL80211_CMD_SET_SAR_SPECS. The message contains 
>> fileds
>> + *     of %nl80211_sar_attrs which specifies the sar type and related
> 
> typo: fileds .. you mean fields
> 
I will fix all the spelling errors and send V2.

> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
