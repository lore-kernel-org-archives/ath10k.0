Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-f47.google.com ([209.85.215.47])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqRYQ-0004ws-S8
 for ath10k@lists.infradead.org; Thu, 07 May 2015 19:33:55 +0000
Received: by laat2 with SMTP id t2so38144727laa.1
 for <ath10k@lists.infradead.org>; Thu, 07 May 2015 12:33:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMCCUbjs+ZYAm705=KhG=cpwnfAV7UthVCrZfXfmWKQ8TjWpgg@mail.gmail.com>
References: <CAMCCUbgZRhNCWTQkspCuRdCTQy6SpmihEKFHfY8ija4+zYTLiw@mail.gmail.com>
 <CAD1M0618J5LX9-6CtRHfunNJD+4F0yaBAaDNi62H8z9e_3DryQ@mail.gmail.com>
 <CAMCCUbjs+ZYAm705=KhG=cpwnfAV7UthVCrZfXfmWKQ8TjWpgg@mail.gmail.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Thu, 7 May 2015 12:33:01 -0700
Message-ID: <CAD1M062qiQ7j+2_Q6pT7kw4UD87Jv4vatG-1epwmyOAPozws4w@mail.gmail.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, May 7, 2015 at 11:01 AM, richard mayers
<richard.mayers92@gmail.com> wrote:
> Its only 30% of CPU usage when I am transmit at maximum speed. May be
> I am not checking it correctly, I just use top and then press 1 and it
> splits the cores (it has only 2). In the worst case if 30% was the
> average it should be a maximum of 60% in one single core.

And you're getting your 30% CPU usage from (100 - IDLE), correct?
Don't just look at the 'us' column.

Going back to over drive on the chains, instead of mucking around with
antenna orientation and distance, I would go out and buy some
attenuators and put them between the channels. Then change the tx
power on the AP until you're absolutely tuned up. Otherwise, these
tests are somewhat moot in my opinion.

- Pushpal

> Richard.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
