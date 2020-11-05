Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kadaF-0002fU-W5
 for ath10k@lists.infradead.org; Thu, 05 Nov 2020 11:37:42 +0000
MIME-Version: 1.0
Date: Thu, 05 Nov 2020 19:37:38 +0800
From: Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [RFC 1/2] nl80211: add common API to configure SAR power
 limitations.
In-Reply-To: <CA+ASDXNAXo=p=_MbNXG+Mma37v5b6gAPySsXpNh6CC+L_gLnXQ@mail.gmail.com>
References: <1600753775-4745-1-git-send-email-cjhuang@codeaurora.org>
 <6649b0c2ff988c2ae8723ea633f86cc12da43d95.camel@sipsolutions.net>
 <d424aa0e80ac55e511ddb33b41d40fea@codeaurora.org>
 <CA+ASDXNAXo=p=_MbNXG+Mma37v5b6gAPySsXpNh6CC+L_gLnXQ@mail.gmail.com>
Message-ID: <2cd38a14d4ffaebc4d0b422c55397d87@codeaurora.org>
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
To: Brian Norris <briannorris@chromium.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless <linux-wireless@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, ath10k <ath10k@lists.infradead.org>, Abhishek Kumar <kuabhs@google.com>

On 2020-11-05 01:48, Brian Norris wrote:
> On Wed, Nov 4, 2020 at 12:44 AM Carl Huang <cjhuang@codeaurora.org> 
> wrote:
>> On 2020-09-28 20:36, Johannes Berg wrote:
>> > On Tue, 2020-09-22 at 13:49 +0800, Carl Huang wrote:
>> >> +struct cfg80211_sar_freq_ranges {
>> >> +    u8 index;
>> >
>> > Does an index here make sense?
>> >
>> With agreement from Google, it's OK to remove it.
> 
> I'm not sure "Google" is the arbiter of the nl80211 API, even if we
> are the current planned users ;)
> 
> But I think I agree with Johannes, that given the other plans (user
> space must send all bands all the time; dropping the "apply to all
> bands" support), an index isn't really necessary in either the user
> space API or the internal representation handed down to drivers. All
> bands should be specified, in order.
> 
> Brian
> 
The index here will be removed.

But let's keep the explicit index in SET command. I think it adds no
burden to userspace but has flexibility to skip some ranges as we
remove "all or nothing" limitation.


>> >> +    u32 start_freq;
>> >> +    u32 end_freq;
>> >> +};

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
