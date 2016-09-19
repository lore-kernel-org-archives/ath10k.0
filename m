Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bm1rI-0000zz-Di
 for ath10k@lists.infradead.org; Mon, 19 Sep 2016 16:55:56 +0000
Message-ID: <57E01220.3060302@candelatech.com>
Date: Mon, 19 Sep 2016 09:28:17 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Issue with ATH10K driver with 802.11 a/g mode datarates
References: <20160919041857.M30046@universe.cdotb.ernet.in>
In-Reply-To: <20160919041857.M30046@universe.cdotb.ernet.in>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sridhar Kondabathini <sridhark@cdot.in>, Horse <horse@gentrice.net>, ath10k@lists.infradead.org, michal.kazior@tieto.com, Raj Joshi <rajjoshi@comp.nus.edu.sg>

Out of curiosity, does ath9k perform at the required rates in a similar
setup?

Sending tcp, udp, or some other protocol?  How are you generating the
traffic?

Thanks,
Ben

On 09/18/2016 09:26 PM, Sridhar Kondabathini wrote:
> Hi,
>
>      When we are testing 802.11 a/g mode throughput measurements on T1024RDB ( we used
> kernel-3.12; ath10k drivers backported from 4.4;hostapd 2.5 for 11AC support), then we
> are getting 26-27 Mbps , which is not meeting the required TEC specification (which is
> ~28 Mbps). How can we increase the throughput in these modes.
>
>       Can you please help on this.
>
>
>
> Regards,
>
> Sridhar Kondabathini,
> Research engineer,
> PSG lab,
> Center for Development Of Telematics
> 9480484821.
>
>
>
>
> Disclaimer:
> ----------
> This email and any files transmitted with it are confidential and intended solely
> for
> the use of the individual or entity to whom they are addressed.  If you are not the
> intended recipient you are notified that disclosing, copying, distributing or taking
> any
> action in reliance on the contents of this information is strictly prohibited. The
> sender does not a
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
