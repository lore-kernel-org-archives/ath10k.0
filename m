Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WISj3-0005OO-R2
 for ath10k@lists.infradead.org; Wed, 26 Feb 2014 00:51:54 +0000
Message-ID: <530D3A92.9080503@candelatech.com>
Date: Tue, 25 Feb 2014 16:51:30 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone have a working hostapd conf file for AC?
References: <530D128B.3030509@candelatech.com>
 <CAHqTa-0xkrJxiHTRJrc5hnA+-nA3AONOpMXFWS+1wcSuPdaFPA@mail.gmail.com>
In-Reply-To: <CAHqTa-0xkrJxiHTRJrc5hnA+-nA3AONOpMXFWS+1wcSuPdaFPA@mail.gmail.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 02/25/2014 04:19 PM, Avery Pennarun wrote:
> On Tue, Feb 25, 2014 at 2:00 PM, Ben Greear <greearb@candelatech.com> wrote:
>> Does anyone have a working hostapd config file for
>> ath10k?
> 
> Here's mine (20/40/80 MHz all supported):

Thanks...I managed to get something similar working
(open authentication in my case).

I also had to update the regulatory.bin, which enabled
HT80.

But, when using ath10k as AP, with both my firmware and the official
10.1.467 firmware, my stations (always ath10k with my hacked firmware) can associate
but do not receive any DHCP responses.

When I use my ath10k stations against a Netgear AC AP, then they
associate and get DHCP and pass traffic to each other...  The reported
rx encoding rate is never reaches much above 200Mbps, though..seems like
it would train up higher.

My ath10k stations also work fine against an ath9k /n AP.

Hard to know what to blame though...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
