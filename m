Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fo2Qp-0000NC-V6
 for ath10k@lists.infradead.org; Fri, 10 Aug 2018 08:06:02 +0000
From: Wen Gong <wgong@qti.qualcomm.com>
Subject: RE: [PATCH v2 2/2] ath10k: Set sk_pacing_shift to 6 for 11AC WiFi
 chips
Date: Fri, 10 Aug 2018 08:05:39 +0000
Message-ID: <f185ab8722e84c959b375e606d25a29b@aptaiexm02f.ap.qualcomm.com>
References: <1533724802-30944-1-git-send-email-wgong@codeaurora.org>
 <1533724802-30944-3-git-send-email-wgong@codeaurora.org>
 <87sh3pdtpg.fsf@toke.dk>
In-Reply-To: <87sh3pdtpg.fsf@toke.dk>
Content-Language: en-US
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: =?iso-8859-1?Q?Toke_H=F8iland-J=F8rgensen?= <toke@toke.dk>, Wen Gong <wgong@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "johannes@sipsolutions.net" <johannes@sipsolutions.net>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Toke
> H=F8iland-J=F8rgensen
> Sent: Wednesday, August 8, 2018 6:44 PM
> To: Wen Gong <wgong@codeaurora.org>; ath10k@lists.infradead.org;
> johannes@sipsolutions.net
> Cc: linux-wireless@vger.kernel.org
> Subject: Re: [PATCH v2 2/2] ath10k: Set sk_pacing_shift to 6 for 11AC WiFi
> chips
> =

> Wen Gong <wgong@codeaurora.org> writes:
> =

> > Upstream kernel has an interface to help adjust sk_pacing_shift to
> > help improve TCP UL throughput.
> > The sk_pacing_shift is 8 in mac80211, this is based on test with 11N
> > WiFi chips with ath9k. For QCA6174/QCA9377 PCI 11AC chips, the 11AC
> > VHT80 TCP UL throughput testing result shows 6 is the optimal.
> > Overwrite the sk_pacing_shift to 6 in ath10k driver for QCA6174/9377 PC=
I.
> >
> > Tested with QCA6174 PCI with firmware
> > WLAN.RM.4.4.1-00109-QCARMSWPZ-1, but this will also affect QCA9377
> PCI.
> > It's not a regression with new firmware releases.
> >
> > There have 2 test result of different settings:
> >
> > ARM CPU based device with QCA6174A PCI with different
> > sk_pacing_shift:
> >
> >  sk_pacing_shift  throughput(Mbps)             CPU utilization
> >          6            500(-P5)      ~75% idle, Focus on CPU1: ~14%idle
> >          7            454(-P5)      ~80% idle, Focus on CPU1: ~4%idle
> >          8               288        ~90% idle, Focus on CPU1: ~35%idle
> >          9              ~200        ~92% idle, Focus on CPU1: ~50%idle
> >
> > 5G TCP UL VTH80 on X86 platform with QCA6174A PCI with
> > sk_packing_shift set to 6:
> >
> >   tcp_limit_output_bytes            throughput(Mbps)
> >  default(262144)+1 Stream                 336
> >  default(262144)+2 Streams                558
> >  default(262144)+3 Streams                584
> >  default(262144)+4 Streams                602
> >  default(262144)+5 Streams                598
> >  changed(2621440)+1 Stream                598
> >  changed(2621440)+2 Streams               601
> =

> You still haven't provided any latency numbers for these tests, which mak=
es
> it impossible to verify that setting sk_pacing_shift to 6 is the right tr=
adeoff.
> =

> As I said before, from your numbers I suspect the right setting is actual=
ly 7,
> which would be 10-20ms less latency under load; way more important than
> ~50 Mbps...
> =

Hi Toke,
Could you give the command line for the latency test?
https://flent.org/intro.html#quick-start
I used the command but test failed:
flent tcp_download -p 1 -l 60 -H 192.168.1.5 -t text-to-be-included-in-plot=
 -o file1.png
error loading plotter: unable to find plot configuration "1"

> -Toke
> =

> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
