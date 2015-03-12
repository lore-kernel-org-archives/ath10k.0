Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW30g-0006WH-Cb
 for ath10k@lists.infradead.org; Thu, 12 Mar 2015 13:18:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Remove trace about getting temperature
References: <1424802385-23017-1-git-send-email-mka@chromium.org>
 <87h9tsyhin.fsf@kamboji.qca.qualcomm.com>
 <CAKZ8rEOVf4q_i7at=h3PiwwGDNeuiEL467wFCOwADwd0BhtbCw@mail.gmail.com>
Date: Thu, 12 Mar 2015 15:17:51 +0200
In-Reply-To: <CAKZ8rEOVf4q_i7at=h3PiwwGDNeuiEL467wFCOwADwd0BhtbCw@mail.gmail.com>
 (Matthias Kaehlcke's message of "Tue, 10 Mar 2015 09:24:52 -0700")
Message-ID: <87d24euzgg.fsf@kamboji.qca.qualcomm.com>
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
To: Matthias Kaehlcke <mka@google.com>
Cc: Matthias Kaehlcke <mka@chromium.org>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, ath10k@lists.infradead.org

Matthias Kaehlcke <mka@google.com> writes:

>     > -     ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi pdev get temperature\n");
>     >       return skb;
>
>     I'm worried that this is dangerous, as that means that not all WMI
>     commands will be in debug and something might be missed because of that.
>
>
> I see your concern
>  
>
>     Isn't there any other way? Like implementing ath10k_dbg_ratelimit()? Or
>     adding a new log level?
>
>
> Switching to dynamic debugging (dev_dbg, ...) could be an option. Debug
> messages would be disabled by default but can be enabled at runtime

I don't really like dynamic debugging framework as it's not really
convenient with bigger drivers like ath10k. Is it possible to add
support for dynamic debugging without sacrificing the current debug
functionality, especially setting debug levels via debug_mask
parameters?


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
