Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0aiL-0000wJ-O9
 for ath10k@lists.infradead.org; Fri, 27 Jun 2014 18:17:34 +0000
Received: by mail-ob0-f177.google.com with SMTP id uy5so5773599obc.8
 for <ath10k@lists.infradead.org>; Fri, 27 Jun 2014 11:17:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1403860015-31601-1-git-send-email-michal.kazior@tieto.com>
References: <1403860015-31601-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 27 Jun 2014 11:17:11 -0700
Message-ID: <CABnBrYWuro1i3SvjpEMF+5rcja=7e_7RP2y-m4hVi_Ld4LYHuQ@mail.gmail.com>
Subject: Re: [RFC/RFT 0/2] mac80211/ath10k: fix Rx reordering
From: Denton Gentry <denton.gentry@gmail.com>
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
Cc: linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

With these two changes the iperf throughput of the Windows STA
increased to 283 Mbps, up from ~45 Mbps prior to these changes.

Everything else is as constant as I can hold it, no other code changes
and in the same physical location. It is an open air office
environment, the noise environment can vary day to day.

On Fri, Jun 27, 2014 at 2:06 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> Hi,
>
> I'm posting these 2 patches together in a single
> patchset for easier review/testing for now. Once
> review goes well I can split up the patchset and
> send patches separately if it is desired so.
>
> Recently Denton pointed out ath10k fails to
> perform Rx reordering and this causes performance
> issues in some cases.
>
> Due to ath10k design I had to come up with a patch
> for mac80211 to allow Rx reordering offloading via
> existing Rx BA sessions code.
>
> I've tested this pretty lightly so far. With the
> patchset `iperf -u` reports 0* out-of-order
> frames. Without the patch I'm seeing 400+ per
> second (the particular number isn't relevant as it
> depends on throughput and environment). It seems
> to improve single-threaded TCP performance as
> well. All test traffic is station -> ath10k AP.
>
> * There are a few out-of-rder frames in the first
> second after Rx tid is set up. I suspect this is
> because ath10k is forced to start Rx BA sesion
> with an arbitrary start_seq_num.
>
> Note: This is based on https://github.com/kvalo/ath
> 30a165cb84793fa3896ad93497e11eed651b1813.
>
>
> Michal Kazior (2):
>   mac80211: add support for Rx reordering offloading
>   ath10k: fix Rx aggregation reordering
>
>  drivers/net/wireless/ath/ath10k/htt_rx.c |  92 +++++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath10k/mac.c    |  30 +++++++++
>  drivers/net/wireless/ath/ath10k/txrx.c   |   3 +-
>  drivers/net/wireless/ath/ath10k/txrx.h   |   1 +
>  include/net/mac80211.h                   |  40 ++++++++++++
>  net/mac80211/agg-rx.c                    | 108 ++++++++++++++++++++++++-------
>  net/mac80211/ieee80211_i.h               |  16 +++++
>  net/mac80211/iface.c                     |  25 +++++++
>  8 files changed, 287 insertions(+), 28 deletions(-)
>
> --
> 1.8.5.3
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
