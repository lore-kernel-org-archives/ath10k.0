Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cil4z-0005SA-15
 for ath10k@lists.infradead.org; Tue, 28 Feb 2017 16:56:54 +0000
Subject: Re: QCA9880 slow performance adhoc/IBSS mode
References: <00d001d291e2$dfb7d950$9f278bf0$@rora.be>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <ef864ddb-87e0-5eb6-e8f0-6d4e7af2decf@candelatech.com>
Date: Tue, 28 Feb 2017 08:56:26 -0800
MIME-Version: 1.0
In-Reply-To: <00d001d291e2$dfb7d950$9f278bf0$@rora.be>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ralph Houthoofdt <ralph@rora.be>, ath10k@lists.infradead.org

Run iperf on a separate machine, as the apu2 have too weak of a CPU
to drive the wifi network at full speed.  And, publish what results you
do get, including RF information such as channel and how congested is your
test area.  Try udp as well as tcp.

Thanks,
Ben

On 02/28/2017 08:51 AM, Ralph Houthoofdt wrote:
> Dear all,
>
> I=92m currently doing me masters thesis on the subject of Wireless Mesh
> Networks and how to optimize them for home use.
> The devices I use are 5x PC Engine APU2c4 with 2x QCA9880 chip (Compex
> WLE900VX). All of them are running LEDE (OpenWRT fork).
>
> The problem I=92m experiencing is the same as
> http://lists.infradead.org/pipermail/ath10k/2017-January/009075.html . Us=
ing
> the tips mentioned I did not come to a better performance. I=92m thinking=
 it=92s
> driver related..
> When running iperf3 only one direction is running at a reasonable
> throughput. Since I am using adhoc mode primarily I decided to use these
> packages:
> -	Kmod-ath10k-ct
> -	Ath10k-firmware-qca988x-ct
> Some sources on the internet said that using the Candela Tech drivers sho=
uld
> result in better support for adhoc/mesh networks.
>
> As suggested in the other issue linked above, I switched TCP congestion
> control to =91Reno=92 instead of the default =91Cubic=92.
> I also did try the command =93iw reg set BE=94 since I am from Belgium, b=
ut
> running =93iw reg get=94 right after still gave me US as a result.
>
> Let me know what additional command info I should post. Any help would be
> greatly appreciated.
>
> Iwconfig:
> adhoc0    IEEE 802.11  ESSID:"mesh"
>           Mode:Ad-Hoc  Frequency:5.18 GHz  Cell: 02:CA:FE:CA:CA:40
>           Tx-Power=3D20 dBm
>           RTS thr:off   Fragment thr:off
>           Encryption key:off
>           Power Management:off
>
>
> Iw reg get (I=92m from Belgium):
> global
> country BE: DFS-ETSI
>         (2402 - 2482 @ 40), (N/A, 20), (N/A)
>         (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
>         (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
>         (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
>         (57000 - 66000 @ 2160), (N/A, 40), (N/A)
>
> phy#1
> country US: DFS-FCC
>         (2402 - 2472 @ 40), (N/A, 30), (N/A)
>         (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
>         (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
>         (5490 - 5730 @ 160), (N/A, 23), (0 ms), DFS
>         (5735 - 5835 @ 80), (N/A, 30), (N/A)
>         (57240 - 63720 @ 2160), (N/A, 40), (N/A)
>
> phy#0
> country US: DFS-FCC
>         (2402 - 2472 @ 40), (N/A, 30), (N/A)
>         (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
>         (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
>         (5490 - 5730 @ 160), (N/A, 23), (0 ms), DFS
>         (5735 - 5835 @ 80), (N/A, 30), (N/A)
>         (57240 - 63720 @ 2160), (N/A, 40), (N/A)
>
>
> Kind regards,
> Met vriendelijke groeten,
> Ralph Houthoofdt
> Student industri=EBle wetenschappen informatica
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- =

Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
