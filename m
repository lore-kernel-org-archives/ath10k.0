Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bD48x-00016M-1x
 for ath10k@lists.infradead.org; Wed, 15 Jun 2016 06:17:39 +0000
Date: Wed, 15 Jun 2016 11:46:53 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: Problem with spectral scan in VHT80 mode
Message-ID: <20160615061653.GA4593@atheros-ThinkPad-T61>
References: <CAFc9h7vk6e-BntP+GMv8s2jaNSOkA=37rChTjss2-7mgupAv7Q@mail.gmail.com>
 <CAFc9h7uABMUJ349bgNJLcZDNL5hyp96CrYoc8PD9VDLv_-8rqw@mail.gmail.com>
 <20160614053011.GB2800@atheros-ThinkPad-T61>
 <CAFc9h7u4yTesQR3D++D3sKZ9Lv9tek_=JMtwzs=1jTNnXjVvBw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFc9h7u4yTesQR3D++D3sKZ9Lv9tek_=JMtwzs=1jTNnXjVvBw@mail.gmail.com>
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
To: Gaurang Ramesh Naik <gaurang@vt.edu>
Cc: ath10k@lists.infradead.org

Hi Gaurang,

thanks a lot will check the spectral scan results.

regards,
shafi

On Tue, Jun 14, 2016 at 12:33:38PM -0400, Gaurang Ramesh Naik wrote:
> Hi Shafi,
> 
> I am using QCA9882 (I'm using RB911G-5HPacD). This is what I observed
> http://postimg.org/image/vha3pmvhz/
> 
> I have one AP-Client running iperf over HT40 and I'm using another AP
> for the scan.
> 
> Thanks,
> Gaurang.
> 
> On Tue, Jun 14, 2016 at 1:30 AM, Mohammed Shafi Shajakhan
> <mohammed@codeaurora.org> wrote:
> > Hi Gaurang,
> >
> > On Tue, Jun 14, 2016 at 01:08:29AM -0400, Gaurang Ramesh Naik wrote:
> >> Apologies for my previous e-mail. I had read the whole page once, but
> >> somehow I missed the point about 64 bins for VHT80. It's working now.
> >
> > [shafi] may i know the chipset you are testing, also if its feasible
> > you can share the graph plots of the spectral scan .
> >
> >>
> >> On Tue, Jun 14, 2016 at 12:37 AM, Gaurang Ramesh Naik <gaurang@vt.edu> wrote:
> >> > Hello,
> >> >
> >> > I was trying the ath10k's spectral scan. I used the following commands
> >> > given on the link
> >> > https://wireless.wiki.kernel.org/en/users/drivers/ath10k/spectral
> >> >
> >> > echo 8 > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_count
> >> > echo manual > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan_ctl
> >> > echo trigger > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan_ctl
> >> > cat /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan0 >> /tmp/fft.dump
> >> >
> >> > I am using OpenWrt Bleeding edge. In the HT20 and HT40 mode, I
> >> > correctly get 8 samples. However, in the VHT80 mode, the /tmp/fft.dump
> >> > file generated is empty.
> >> >
> >> > In the open issues on the above link, it said that the HT40 and HT20
> >> > modes ignore the count parameter. That isn't the case for me. I seem
> >> > to get correct # of samples (I view the dump file using
> >> > https://github.com/simonwunderlich/FFT_eval). However, in the VHT80
> >> > mode, there seems to be no output. Am I doing something wrong here?
> >> >
> >
> > regards,
> > shafi
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
