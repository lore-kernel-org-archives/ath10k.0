Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5CwD-0003aO-E9
 for ath10k@lists.infradead.org; Thu, 10 Jul 2014 11:54:58 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Thu, 10 Jul 2014 13:51:36 +0200
Subject: RE : RE : Bridging problem in ath10k (STA)
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F15C1D7E4@srvexch01.SODIELEC.local>
References: <CAEFj986inLh+Upgx-rVF0zviii+yaQZnr9cuMYOXAqEjXrVMvQ@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FC@srvexch01.SODIELEC.local>
 <CAEFj986wbAp3-7y3ocpYzCWvYU=J0H6fQbrnMA3-qetRruF6RA@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FE@srvexch01.SODIELEC.local>
 <CAEFj986pnp2qHu8YuYyHLN66jAy2Mf+AAS=pLsuK6gdq6BU23Q@mail.gmail.com>
 <CA+BoTQnpdcBOrX32Ma7q0OZ5eaPYM31g8VV4HU==nMUqfA2Fzw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7E0@srvexch01.SODIELEC.local>
 <CALhHN=qAGsGa_+79he1R9okHEj8ZoJdEUYUC0tM4jQy0Y9ogxQ@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7E1@srvexch01.SODIELEC.local>,
 <CALhHN=oBttgRd2-F2+UNy9NHPpX4yGXjTD-mhXsg+8sk7Czz=w@mail.gmail.com>
In-Reply-To: <CALhHN=oBttgRd2-F2+UNy9NHPpX4yGXjTD-mhXsg+8sk7Czz=w@mail.gmail.com>
Content-Language: fr-FR
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>>>Just guessing, Is wlan0.sta1 added to bridge? If not what if you will
>>>add it manually after created?

>> Sorry I don't really understand your question. My AP has the interface br0 which connects wlan0 and eth0.
>>I should run "iw dev wlan0.sta1 set 4addr on" to add it manually?
>> And can you guess why does Iperf cause the problem? That interface is created only when I run Iperf, not when
>> pinging between two devices cause my STA is non-bridged and it associate on the interface wlan0 of AP.

>try this:
>brctl addif brX wlan0.sta1

Thank you, I did it but the command returns "the interface wlan0.sta1 is already a member of the bridge, can not enslave
it to the bridge br0".  And I still lost the connection between AP and STA (pinging not success).


NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
