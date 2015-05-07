Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqPBG-0000iM-Th
 for ath10k@lists.infradead.org; Thu, 07 May 2015 17:01:51 +0000
Received: by wgiu9 with SMTP id u9so49853246wgi.3
 for <ath10k@lists.infradead.org>; Thu, 07 May 2015 10:01:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMCCUbgZRhNCWTQkspCuRdCTQy6SpmihEKFHfY8ija4+zYTLiw@mail.gmail.com>
References: <CAMCCUbgZRhNCWTQkspCuRdCTQy6SpmihEKFHfY8ija4+zYTLiw@mail.gmail.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Thu, 7 May 2015 10:00:57 -0700
Message-ID: <CAD1M0618J5LX9-6CtRHfunNJD+4F0yaBAaDNi62H8z9e_3DryQ@mail.gmail.com>
Subject: Re: Cannot achieve throughput higher than 460Mbps using CT firmware
 and 3x3 ath10k
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
To: richard mayers <richard.mayers92@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wed, May 6, 2015 at 8:01 AM, richard mayers
<richard.mayers92@gmail.com> wrote:
> Hi all,
>
> The maximum throughput I get with the following set up is around
> 460-470Mbits/s when using MCS 6, 80MHz channel and 3 spatial streams.
> However, when I try MCS 7, the throughput drops to 200Mbits/s, and
> when I use 8 or 9 it goes to 0. The signal level is -11dBm which I
> guess is quite good.
>
> Do you have any indications of what I do wrong and cannot get 600Mbps
> throughput, as mention in previous messages in this list? Any help is
> highly appreciated.
>
> My set up is as follows:
>
> - STA: compex wle900vx (QCA988x), ubuntu 14.04 LTS, dell dual core
> 1.66ghz, kernel version 3.16, driver backport 4.0.1 and as a firmware
> the commercial firmware from Candela Tech (
> 10.4.467-ct-com-full-013-b5b14a).

Honestly, I think it's your CPU. Run top while doing your throughput
test, and I think you'll see 100% sirq (pegged CPU core). Also make
sure you split the CPU's up so you're not looking at the 'total' cpu
count.

- Pushpal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
