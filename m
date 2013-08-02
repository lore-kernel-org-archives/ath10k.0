Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([144.76.43.152] helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5EzB-000208-KH
 for ath10k@lists.infradead.org; Fri, 02 Aug 2013 13:01:38 +0000
Message-ID: <1375448470.18144.10.camel@jlt4.sipsolutions.net>
Subject: Re: [RFC 1/3] nl/cfg80211: add chan_time for scan request
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 02 Aug 2013 15:01:10 +0200
In-Reply-To: <CA+BoTQ=XNeYL1KLGQ4gRCZ03a9XsAWde4O7_T-dqKndLLKeX_g@mail.gmail.com>
 (sfid-20130802_135231_798451_6ACEA72F)
References: <1375087158-22077-1-git-send-email-michal.kazior@tieto.com>
 <1375087158-22077-2-git-send-email-michal.kazior@tieto.com>
 <1375342845.8608.8.camel@jlt4.sipsolutions.net>
 <CA+BoTQm+rWRRpp6XQ_-YHMBfH0Q4ecZ3z-6TV3cvFZ=8uXWsQA@mail.gmail.com>
 <1375442751.18144.7.camel@jlt4.sipsolutions.net>
 <CA+BoTQ=XNeYL1KLGQ4gRCZ03a9XsAWde4O7_T-dqKndLLKeX_g@mail.gmail.com>
 (sfid-20130802_135231_798451_6ACEA72F)
Mime-Version: 1.0
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org


> > That's what I'm worried about - the implicit semantic change here.
> 
> I think I understand your point now.
> 
> I'm thinking of using series of passive scans for ACS now, so perhaps
> the whole chan_time stuff is unnecessary. What are your thoughts about
> it?

Well, still then you're relying on the fact that passive channels scans
will stick to each channel for ~110ms or so. This is true today, but
it's not really specified.

I don't think that using the scan command would be a big deal, but maybe
this 'measurement' behaviour should be explicitly enabled? Maybe other
devices even have to do something special to collect the data.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
