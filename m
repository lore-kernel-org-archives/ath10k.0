Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x229.google.com ([2607:f8b0:400c:c01::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wtx9b-0000kf-5m
 for ath10k@lists.infradead.org; Mon, 09 Jun 2014 10:50:15 +0000
Received: by mail-ve0-f169.google.com with SMTP id jx11so6330682veb.28
 for <ath10k@lists.infradead.org>; Mon, 09 Jun 2014 03:49:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F109978FE@srvexch01.SODIELEC.local>
References: <CAEFj986inLh+Upgx-rVF0zviii+yaQZnr9cuMYOXAqEjXrVMvQ@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FC@srvexch01.SODIELEC.local>
 <CAEFj986wbAp3-7y3ocpYzCWvYU=J0H6fQbrnMA3-qetRruF6RA@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FE@srvexch01.SODIELEC.local>
Date: Mon, 9 Jun 2014 18:49:52 +0800
Message-ID: <CAEFj986pnp2qHu8YuYyHLN66jAy2Mf+AAS=pLsuK6gdq6BU23Q@mail.gmail.com>
Subject: Re: RE : RE : Bridging problem in ath10k (STA)
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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

Hmm, redo the testing. The FW is not crashed on STA site, but could
not ping the AP or IP behind the AP once bridging. Only happen if the
AP is operating at 80MHz.

Any idea on what to look for?

----
ChunYeow

On Wed, Jun 4, 2014 at 6:27 PM, Vu Hai NGUYEN
<vh.nguyen@actiasodielec.fr> wrote:
>>I have tested with the following CT firmware:
>>http://www.candelatech.com/downloads/firmware-2-ct-community.bin
>
>>But seems not working for STA mode. I am having problem if the AP is
>>configured as 802.11ac. Is this FW that you mentioned?
>
> Yes, I can enter promiscuous mode to set up bridge network (before associated with AP, configured as 802.11ac) with the firmware in your link or this one:
> http://www.candelatech.com/downloads/firmware-2-ct-non-commercial.bin
>
> NGUYEN Vu Hai
> Acita-Sodielec
> Route de Mayres - B.P. 9
> 12100 St GEORGES DE LUZENCON
> FRANCE
>
>
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
