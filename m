Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuG4R-0007B0-Ca
 for ath10k@lists.infradead.org; Tue, 10 Jun 2014 07:02:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: RE : RE : Bridging problem in ath10k (STA)
References: <CAEFj986inLh+Upgx-rVF0zviii+yaQZnr9cuMYOXAqEjXrVMvQ@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FC@srvexch01.SODIELEC.local>
 <CAEFj986wbAp3-7y3ocpYzCWvYU=J0H6fQbrnMA3-qetRruF6RA@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FE@srvexch01.SODIELEC.local>
 <CAEFj986pnp2qHu8YuYyHLN66jAy2Mf+AAS=pLsuK6gdq6BU23Q@mail.gmail.com>
 <CA+BoTQnpdcBOrX32Ma7q0OZ5eaPYM31g8VV4HU==nMUqfA2Fzw@mail.gmail.com>
 <CAEFj985CuYtOLQtf3j2=CvDTDhqAek351=wThbxpw9ijj5kcnA@mail.gmail.com>
Date: Tue, 10 Jun 2014 10:01:35 +0300
In-Reply-To: <CAEFj985CuYtOLQtf3j2=CvDTDhqAek351=wThbxpw9ijj5kcnA@mail.gmail.com>
 (Yeoh Chun-Yeow's message of "Tue, 10 Jun 2014 12:17:47 +0800")
Message-ID: <87tx7tckog.fsf@kamboji.qca.qualcomm.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:

>> Does this reproduce if you have non-bridged STA connected to an AP
>> while the STA interface is in promiscuous mode (so that monitor vdev
>> is running)? If it doesn't reproduce I'd look for AP configuration
>> issue. Does your AP have wds_sta=1?
>
> Oops, I missed out the wds_sta=1 in my second config file. So it seems
> that this solve the problem.

It would be good if someone could add a section to the wiki how to
configure this:

http://wireless.kernel.org/en/users/Drivers/ath10k/configuration

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
