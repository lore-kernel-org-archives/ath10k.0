Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk19z-0006tI-SM
 for ath10k@lists.infradead.org; Tue, 01 Dec 2020 08:37:22 +0000
Received: by mail-io1-xd44.google.com with SMTP id i9so803713ioo.2
 for <ath10k@lists.infradead.org>; Tue, 01 Dec 2020 00:37:17 -0800 (PST)
MIME-Version: 1.0
References: <20201120085312.4355-1-cjhuang@codeaurora.org>
 <20201120085312.4355-2-cjhuang@codeaurora.org>
 <CA+ASDXMRPRPD0XFJeHTRv3Bc13VFehkyDoYHQfaA0cP-STDOLg@mail.gmail.com>
 <8f0121e9996bad2266a928279e7eb26a@codeaurora.org>
In-Reply-To: <8f0121e9996bad2266a928279e7eb26a@codeaurora.org>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Tue, 1 Dec 2020 00:37:04 -0800
Message-ID: <CACTWRwt43EJ9njgtJvVEd9vx3Abs7=X6cDrOL4aAqPRMQyJB8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] nl80211: add common API to configure SAR power
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
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, ath10k <ath10k@lists.infradead.org>, Abhishek Kumar <kuabhs@google.com>

The V2 patch looks good to me.
Regarding Brian's comment

> [1] By the way, you aren't checking for duplicates; so users could
> pass the same index many times, and it's not clear from the API
> definition what should happen. It seems the current implementation is
> that you'll just use the last value provided.

I don't think we should be adding any logic in the kernel to check for
duplicates, but rather userspace should take care of those. As long as
the data provided abides by the data policy, the kernel should bother.
But I do agree with Brian's other comment that it might be made more
clear in comment. If at all a V3 is needed, then we should add that,
or else it looks fine.

Reviewed-by: Abhishek Kumar <kuabhs@chromium.org>

Thanks
Abhishek

On Mon, Nov 30, 2020 at 2:10 AM Carl Huang <cjhuang@codeaurora.org> wrote:
>
> On 2020-11-21 10:42, Brian Norris wrote:
> > On Fri, Nov 20, 2020 at 12:53 AM Carl Huang <cjhuang@codeaurora.org>
> > wrote:
> >>
> >> NL80211_CMD_SET_SAR_SPECS is added to configure SAR from
> >> user space. NL80211_ATTR_SAR_SPEC is used to pass the SAR
> >> power specification when used with NL80211_CMD_SET_SAR_SPECS.
> >>
> >> Wireless driver needs to register SAR type, supported frequency
> >> ranges to wiphy, so user space can query it. The index in
> >> frequency range is used to specify which sub band the power
> >> limitation applies to. The SAR type is for compatibility, so later
> >> other SAR mechanism can be implemented without breaking the user
> >> space SAR applications.
> >>
> >> Normal process is user space quries the SAR capability, and
> >> gets the index of supported frequency ranges and associates the
> >> power limitation with this index and sends to kernel.
> >>
> >> Here is an example of message send to kernel:
> >> 8c 00 00 00 08 00 01 00 00 00 00 00 38 00 2b 81
> >> 08 00 01 00 00 00 00 00 2c 00 02 80 14 00 00 80
> >> 08 00 02 00 00 00 00 00 08 00 01 00 38 00 00 00
> >> 14 00 01 80 08 00 02 00 01 00 00 00 08 00 01 00
> >> 48 00 00 00
> >>
> >> NL80211_CMD_SET_SAR_SPECS:  0x8c
> >> NL80211_ATTR_WIPHY:     0x01(phy idx is 0)
> >> NL80211_ATTR_SAR_SPEC:  0x812b (NLA_NESTED)
> >> NL80211_SAR_ATTR_TYPE:  0x00 (NL80211_SAR_TYPE_POWER)
> >> NL80211_SAR_ATTR_SPECS: 0x8002 (NLA_NESTED)
> >> freq range 0 power: 0x38 in 0.25dbm unit (14dbm)
> >> freq range 1 power: 0x48 in 0.25dbm unit (18dbm)
> >>
> >> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> >
> > I think the API is reasonably clear and usable. I'm a little skeptical
> > that the complexity related to indexes is absolutely necessary [1],
> > but at least you make clear what should happen in the case of missing
> > indexes (treated as "max"). But you've addressed my concerns, I think:
> >
> > Reviewed-by: Brian Norris <briannorris@chromium.org>
> >
> > I haven't done the most thorough review on the implementation pieces
> > (and ath10k), but I at least wanted to put my thoughts out there.
> >
> > Thanks,
> > Brian
> >
> > [1] By the way, you aren't checking for duplicates; so users could
> > pass the same index many times, and it's not clear from the API
> > definition what should happen. It seems the current implementation is
> > that you'll just use the last value provided.
> Thanks for the comments.
> It's right the last value is used.
> I can describe it more clearly if V3 is needed.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
