Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x231.google.com ([2607:f8b0:400c:c01::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ws83I-0000hn-OH
 for ath10k@lists.infradead.org; Wed, 04 Jun 2014 10:04:13 +0000
Received: by mail-ve0-f177.google.com with SMTP id db11so8390017veb.22
 for <ath10k@lists.infradead.org>; Wed, 04 Jun 2014 03:03:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F109978FC@srvexch01.SODIELEC.local>
References: <CAEFj986inLh+Upgx-rVF0zviii+yaQZnr9cuMYOXAqEjXrVMvQ@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FC@srvexch01.SODIELEC.local>
Date: Wed, 4 Jun 2014 18:03:51 +0800
Message-ID: <CAEFj986wbAp3-7y3ocpYzCWvYU=J0H6fQbrnMA3-qetRruF6RA@mail.gmail.com>
Subject: Re: RE : Bridging problem in ath10k (STA)
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

I have tested with the following CT firmware:
http://www.candelatech.com/downloads/firmware-2-ct-community.bin

But seems not working for STA mode. I am having problem if the AP is
configured as 802.11ac. Is this FW that you mentioned?

----
ChunYeow

On Wed, Jun 4, 2014 at 5:20 PM, Vu Hai NGUYEN
<vh.nguyen@actiasodielec.fr> wrote:
>>Hi, all
>
>>I just found out that the bridging is not able to work for STA mode
>>even for firmware 10.1.467.2-1 if the AP is operating at 80MHz.
>
>>But it is working if the AP is operating at 20MHz or 802.11n instead
>>of 802.11ac. But off course, the STA needs to associate with AP first
>>before bridging.
>
>>Anyone has the similar problem?
>
> I do have the station with broken firmware in bridge network, the firmware of Ben from CT can fixe it. You can give it a try :D
>
> NGUYEN Vu Hai
> Acita-Sodielec
> Route de Mayres - B.P. 9
> 12100 St GEORGES DE LUZENCON
> FRANCE
>
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
