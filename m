Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYztL-0007M6-O3
 for ath10k@lists.infradead.org; Thu, 25 Feb 2016 17:39:56 +0000
From: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH 1/4] ath10k: remove supported chain mask
Date: Thu, 25 Feb 2016 17:39:08 +0000
Message-ID: <1456421947524.85405@qti.qualcomm.com>
References: <1445948474-16738-1-git-send-email-rmanohar@qti.qualcomm.com>
 <87fv0uq6p7.fsf@kamboji.qca.qualcomm.com>,
 <CALhHN=orRg2mkjcJ1TGssjEocNrRWEhhDV=SKGYANQ-c+YEyzA@mail.gmail.com>,
 <1456233812853.59898@qti.qualcomm.com>
In-Reply-To: <1456233812853.59898@qti.qualcomm.com>
Content-Language: en-US
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
To: "janusz.dziedzic@tieto.com" <janusz.dziedzic@tieto.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>, "greearb@candelatech.com" <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>>>> Removing supported chainmask fields as it can be always derived
>>>> from num_rf_chains.
>>>>
>>>> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
>>>
>> Hello,
>>
>> This one break monitor mode for qca988x and 10.x firmware:
>> After Revert "ath10k: remove supported chain mask" - works correctly.
>>
>Janusz,
>
> Thanks for reporting. Will send out patch asap.
>

Janusz,

It seems the change ("ath10k: remove supported chain mask") just exposed an
hidden problem. The same target assert can be reproduced by below sequence
even after reverting the commit.

ifconfig wlan0 down
iw wlan0 set type monitor
iw phy0 set antenna 7
ifconfig wlan0 up

The actual cause of target assert is below commit.

commit 5572a95b4b5768187652a346356e39e7542ca6e0
Author: Ben Greear <greearb@candelatech.com>
Date:   Mon Nov 24 16:22:10 2014 +0200

    ath10k: apply chainmask settings to vdev on creation

Configuring NSS vdev param on interface addition is causing the target assert in 10.1 firmware.
Just creating monitor interface is causing assert with qca_main firmware.


-Rajkumar
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
