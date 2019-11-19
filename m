Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iX1g6-0007be-RY
 for ath10k@lists.infradead.org; Tue, 19 Nov 2019 11:28:17 +0000
Received: by mail-oi1-x22b.google.com with SMTP id y194so18586128oie.4
 for <ath10k@lists.infradead.org>; Tue, 19 Nov 2019 03:28:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKR_QVLaRKOc0OapvhppCZzYYO+w8h8t+B1amiWGGEiH6FmnjQ@mail.gmail.com>
References: <CAKR_QVLaRKOc0OapvhppCZzYYO+w8h8t+B1amiWGGEiH6FmnjQ@mail.gmail.com>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Tue, 19 Nov 2019 12:28:12 +0100
Message-ID: <CAKR_QVKxoy+2Nt0SB42nm2Js-V4Cy8PdqEO3w2-xJUt7yR8bJQ@mail.gmail.com>
Subject: Re: [BUG] ath10k: CPU scaling related performance issue
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
To: ath10k <ath10k@lists.infradead.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>

quick update:

could not reproduce this on another machine; setting all cores to
lowest state (1.40GHz) and measuring at speedtest gives about 25Mbps
(ubuntu 19.10 live boot defaults), same rate is measured on win10 or
any other ubuntu version with ondemand governor

the machine this has been discovered on is compaq 6735b (it is running
turion x2 ZM87 CPU)
i can reproduce download results difference with ath10k card
connecting to an ath9k 2.4GHz AP directly (without litebeam as bridge)

one more thing discovered: while testing this on ISP's bandwidth test
site the dl speed increase was only reproducible when loading SSL
version of the site

On 14/11/2019, Tom Psyborg <pozega.tomislav@gmail.com> wrote:
> network topology:
> 80211g uplink - 30Mbps is brought into litebeam-5AC that is running AP
> (WDS) mode on 5GHz radio. client device is a laptop (dualcore 2.4GHz)
> running QCA9880 card on ubuntu 10.04 with kernel 4.9.
>
> description:
> booting ubuntu defaults to performance governor (personal
> modification), opening speedtest.net upon boot and measuring
> throughput gets me about 25Mbps download speed.
> setting lowest CPU scaling freq of both cores (600MHz) and repeating
> the speedtest gets about 29-30Mbps in download. i have verified these
> speed differences while downloading several iso files.
>
> confirmation:
> identical results have been observed on a live booted ubuntu 19.10
> identical results have been observed on ubuntu 10.04, but using
> ethernet connection from archer c7 that was connected in client mode
> to litebeam5
>
> ruled out so far:
> -using regular AP-STA instead of APWDS-STAWDS interfaces does not change a
> thing
> -switching to Ben's CT driver and firmware had no impact, the bug is
> present with it too
> -using different card QCA9862/QCA9880 behavior is the same
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
