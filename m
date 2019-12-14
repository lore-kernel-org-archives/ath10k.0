Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ig9rZ-0004yD-UG
 for ath10k@lists.infradead.org; Sat, 14 Dec 2019 16:01:51 +0000
Received: by mail-ot1-x343.google.com with SMTP id g18so3060316otj.13
 for <ath10k@lists.infradead.org>; Sat, 14 Dec 2019 08:01:49 -0800 (PST)
MIME-Version: 1.0
References: <0101016eaadee57a-54500c6d-4751-423f-8bab-5acd8fad2175-000000@us-west-2.amazonses.com>
 <0101016eb61d9520-b0306a23-c9b9-4b57-b708-9f80ac47eef1-000000@us-west-2.amazonses.com>
 <CAMrEMU-VOYeHO2F5AjyWJLqgEVq5HOUHZkMJqGio1qovFPo8ug@mail.gmail.com>
 <b5404ac0-1be1-229f-a9e3-8033cdf7eea9@candelatech.com>
In-Reply-To: <b5404ac0-1be1-229f-a9e3-8033cdf7eea9@candelatech.com>
From: Justin Capella <justincapella@gmail.com>
Date: Sat, 14 Dec 2019 08:01:33 -0800
Message-ID: <CAMrEMU_2D9KzPudqVEMv-JS73JZD=hrmtf4drk41Hd1zOqS2dw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: set WMI_PEER_AUTHORIZE after a firmware crash
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
To: Ben Greear <greearb@candelatech.com>, Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>

If you have time to spare I'd be interested in hearing a little more
about your stances on this... I'm trying to learn more about this
stuff and not at all qualified to say one way or the other if it is a
good idea, but my intuition is this is going to lead to inconsistent
state/behaviors. I have been wondering if maybe this change may be
related to some of the fw crash reports coming in--- perhaps marking
the station as authorized before the fw is fully started and/or the
device is present

On Mon, Dec 2, 2019 at 10:17 AM Ben Greear <greearb@candelatech.com> wrote:
>
> On 12/1/19 8:45 PM, Justin Capella wrote:
> > Are there security concerns here? Was the peer known to be authorized
> > beforehand? Would it be better to just trash the peer in the event of
> > a fw crash?
>
> I think you should completely re-associate the peer(s) when firmware
> crashes.  The driver does not cache all possible changes, so it cannot
> exactly rebuild the config to the previous state.
>
> Thanks,
> Ben
>
> >
> > On Thu, Nov 28, 2019 at 11:46 PM Kalle Valo <kvalo@codeaurora.org> wrote:
> >>
> >> Wen Gong <wgong@codeaurora.org> wrote:
> >>
> >>> After the firmware crashes ath10k recovers via ieee80211_reconfig(),
> >>> which eventually leads to firmware configuration and including the
> >>> encryption keys. However, because there is no new auth/assoc and
> >>> 4-way-handshake, and firmware set the authorize flag after
> >>> 4-way-handshake, so the authorize flag in firmware is not set in
> >>> firmware without 4-way-handshake. This will lead to a failure of data
> >>> transmission after recovery done when using encrypted connections like
> >>> WPA-PSK. Set authorize flag after installing keys to firmware will fix
> >>> the issue.
> >>>
> >>> This was noticed by testing firmware crashing using simulate_fw_crash
> >>> debugfs file.
> >>>
> >>> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00007-QCARMSWP-1.
> >>>
> >>> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> >>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> >>
> >> Patch applied to ath-next branch of ath.git, thanks.
> >>
> >> 382e51c139ef ath10k: set WMI_PEER_AUTHORIZE after a firmware crash
> >>
> >> --
> >> https://patchwork.kernel.org/patch/11263357/
> >>
> >> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
> >>
> >
>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
