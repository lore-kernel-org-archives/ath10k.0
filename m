Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOOGE-0004y0-FQ
 for ath10k@lists.infradead.org; Fri, 14 Mar 2014 09:18:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Performance of ath10k
References: <EE97821C81277E459BEA5C6384C6F241012D6392146C@srvexch01.SODIELEC.local>
Date: Fri, 14 Mar 2014 11:18:08 +0200
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012D6392146C@srvexch01.SODIELEC.local>
 (Vu Hai NGUYEN's message of "Fri, 14 Mar 2014 10:05:21 +0100")
Message-ID: <87siql87fz.fsf@kamboji.qca.qualcomm.com>
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> writes:

> I'm doing an internship for6 month and my mission is implementation a
> module of 802.11ac in a mini cpu to create an access point of wifi.
> After looking in the internet for a while, I found this potential
> product from Compex:
> http://www.compex.com.sg/productdetailinfo.asp?model=WLE900VX I wonder
> if is there anyone here have tried this with the driver ath10k and
> does it work well or there's still many bugs?

FWIW I'm using ath10k on my main AP at home on 5G (and ath9k on 2.4G)
and I haven't recently had any major problems preventing use. The uptime
right now is:

11:15:46 up 17 days, 16:39,  load average: 0.13, 0.11, 0.13

But as I'm the ath10k maintainer I'm biased :) 

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
