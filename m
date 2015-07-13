Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEbQr-0002rM-LG
 for ath10k@lists.infradead.org; Mon, 13 Jul 2015 10:57:58 +0000
Received: by ieik3 with SMTP id k3so19408487iei.3
 for <ath10k@lists.infradead.org>; Mon, 13 Jul 2015 03:57:36 -0700 (PDT)
Date: Mon, 13 Jul 2015 06:57:26 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: attempting mesh on ath10k
Message-ID: <20150713105726.GA29238@localhost>
References: <CAN+ZWYEK5TpXVsQom5RBxZ1=XCGn9Cq47w1rQdonWNx-ec88vA@mail.gmail.com>
 <20150706214921.GF23012@localhost>
 <20150712142532.GA24495@localhost>
 <20150713014333.GA14152@localhost>
 <CA+BoTQnSJWGq-Pq2aRLvOC9_ieR5GyYk=BoZsNLsszfYPZ-6+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+BoTQnSJWGq-Pq2aRLvOC9_ieR5GyYk=BoZsNLsszfYPZ-6+Q@mail.gmail.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Mon, Jul 13, 2015 at 10:13:59AM +0200, Michal Kazior wrote:
> > Actually, it's any group addressed frame.  I tried playing with various
> > values for htt_data_tx_ext_tid as well as just using the tid on the frame
> > (in mesh group addressed frames still have a qos header with tid=0).
> 
> Just a quick question: did you try applying the sw crypto/raw mode
> patch[1] and using it for mesh?
> 
> [1]: https://patchwork.kernel.org/patch/6600721/

Thanks for the pointer, will give it a try.

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
