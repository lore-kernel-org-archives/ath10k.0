Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail1.g8.pair.com ([66.39.4.88])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YncFc-0007La-U9
 for ath10k@lists.infradead.org; Thu, 30 Apr 2015 00:22:49 +0000
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Subject: Re: Netlink Antenna Support
From: Michael Ney <neym@vorklift.com>
In-Reply-To: <554160D1.70809@candelatech.com>
Date: Wed, 29 Apr 2015 20:22:25 -0400
Message-Id: <A2FA0C75-C20E-4DCF-A456-84C8B3665E47@vorklift.com>
References: <CAP-AUyhhuXGL_U2rx5_h1Qp3+fR8KSGkrnp2iXoeeZ5h1+K9YA@mail.gmail.com>
 <554160D1.70809@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>, Brandon Enochs <enochs.brandon@gmail.com>
Cc: ath10k@lists.infradead.org

Per-antenna rssi is provided by ath10k firmware, but is not currently processed by the driver; the driver only reports the combined rssi (rssi_comb field). You can look at the rx_ppdu_start structure in rx_desc.h to see the rssi data available. I have verified that the pri20_mhz appears to report correctly on the CT firmware (eyeballed, not empirical), but I have not looked at any of the extension channel rssi's.

I think all that should be needed for the primary channel rssi's would be to implement something similar to ath9k's common.c "ath9k_cmn_process_rssi" function for iterating over the chains into ath10k's htt_rx.c "ath10k_htt_rx_h_signal" function.

Michael

> On Apr 29, 2015, at 6:53 PM, Ben Greear <greearb@candelatech.com> wrote:
> 
> On 04/29/2015 01:24 PM, Brandon Enochs wrote:
>> Does anyone know if the ath10k driver will, at some point, support
>> netlink antenna masking?  The ath9k card supported this.  Further,
>> will multiple antenna/signal strength pairs be supported like in the
>> ath9k driver?
> 
> ath10k supports setting the antennas in use (nss).  You can use chains: 0, 0+1, or 0+1+2,
> just like ath9k.
> 
> I don't think ath10k has any logic to report any of the details about antenna signal
> strength for received frames.
> 
> Thanks,
> Ben
> 
>> 
>> Thanks,
>> Brandon
>> 
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>> 
> 
> 
> -- 
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
> 
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
