Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYxvS-0006BM-P9
 for ath10k@lists.infradead.org; Fri, 20 Mar 2015 14:29:27 +0000
Received: by wibgn9 with SMTP id gn9so16062169wib.1
 for <ath10k@lists.infradead.org>; Fri, 20 Mar 2015 07:29:04 -0700 (PDT)
From: Simon Wunderlich <simon@open-mesh.com>
Subject: Re: Re: IBSS support in ath10k - our test results and questions
Date: Fri, 20 Mar 2015 15:26:21 +0100
Message-ID: <1799837.1jGie9QosO@prime>
In-Reply-To: <550B425A.7090505@candelatech.com>
References: <2680922.jiTnlqor3W@prime> <550B425A.7090505@candelatech.com>
MIME-Version: 1.0
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
To: Ben Greear <greearb@candelatech.com>
Cc: sven@open-mesh.com, marek@open-mesh.com, ath10k@lists.infradead.org

On Thursday 19 March 2015 14:40:42 Ben Greear wrote:
> On 03/19/2015 10:06 AM, Simon Wunderlich wrote:
> > [...]
> >  * We see low throughput when communicating via IBSS between 2x ath10k or
> >  1x
> > 
> > ath9k + 1x ath10k (~30 MiBit/s). With HT we would have expected ~150
> > MBit/s, with VHT even more.
> 
> Do you see this problem with only an IBSS interface?  In other words, is my
> firmware worse at this than stock 999.x firmware in same configuration?

Yes, we used your firmware with only one IBSS interface. And yes, in our tests 
your firmware performed worse - with stock 999.x firmware we saw 70-90 Mbit/s, 
which was also not great, but way better. Also in that case we saw that 
aggregation was enabled.

The AP+IBSS concurrently was another test.

As also mentioned originally, 999.x firmware is not an option for us since we 
will eventually need AP and IBSS at the same time.

> 
> Thanks for all the details...  Sounds like you have done more testing on
> this than I have for sure.

We want to integrate IBSS mode into products, so we have to test thoroughly. 
:)

If you also want to focus on IBSS, we would be happy to collaborate and test.

> 
> In case you have a public kernel tree available somewhere with all your
> patches, that might help speed up someone's attempt to reproduce this?

We currently don't have it. I'll ask if we can publish it. Our work was based 
on a backports release on the mac80211 package in OpenWRT, though, so don't 
expect a kernel tree. :)

Thanks, 
    Simon


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
