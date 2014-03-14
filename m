Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx.shared.smtp.dk ([93.90.117.178] helo=smtp.dk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOOmG-00060V-S6
 for ath10k@lists.infradead.org; Fri, 14 Mar 2014 09:51:46 +0000
From: "Trevor Cullen" <tcc@innovelec.co.uk>
Subject: RE: Performance of ath10k
Date: Fri, 14 Mar 2014 09:54:41 -0000
Message-ID: <005b01cf3f6b$6c6c4840$4544d8c0$@innovelec.co.uk>
MIME-Version: 1.0
Content-Language: en-gb
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
To: 'Kalle Valo' <kvalo@qca.qualcomm.com>, 'Vu Hai NGUYEN' <vh.nguyen@actiasodielec.fr>
Cc: ath10k@lists.infradead.org

There's much debate going on in my circles about this card. It's based on
the QCA XB140 reference design which supposedly supports 11a,b,g,n, ac at
2.4G or 5G (not concurrent).

So does ath10k support this card fully?

Trevor

-----Original Message-----
From: ath10k [mailto:ath10k-bounces@lists.infradead.org] On Behalf Of Kalle
Valo
Sent: 14 March 2014 09:18
To: Vu Hai NGUYEN
Cc: ath10k@lists.infradead.org
Subject: Re: Performance of ath10k

Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> writes:

> I'm doing an internship for6 month and my mission is implementation a 
> module of 802.11ac in a mini cpu to create an access point of wifi.
> After looking in the internet for a while, I found this potential 
> product from Compex:
> http://www.compex.com.sg/productdetailinfo.asp?model=WLE900VX I wonder 
> if is there anyone here have tried this with the driver ath10k and 
> does it work well or there's still many bugs?

FWIW I'm using ath10k on my main AP at home on 5G (and ath9k on 2.4G) and I
haven't recently had any major problems preventing use. The uptime right now
is:

11:15:46 up 17 days, 16:39,  load average: 0.13, 0.11, 0.13

But as I'm the ath10k maintainer I'm biased :) 

--
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
