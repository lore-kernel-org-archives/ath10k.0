Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gybUC-0007zB-1S
 for ath10k@lists.infradead.org; Tue, 26 Feb 2019 12:05:26 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ACS scans not returning noise floor
References: <CAMrEMU8siEmdzETiA5gvQ6+OAKiQCqUBgnVcO67rwu-x-BxUKA@mail.gmail.com>
 <CAMrEMU-++j02+sMwMKFS5SSsEzXbu7Sb7WceheKvVPoMUmyi1Q@mail.gmail.com>
Date: Tue, 26 Feb 2019 14:05:19 +0200
In-Reply-To: <CAMrEMU-++j02+sMwMKFS5SSsEzXbu7Sb7WceheKvVPoMUmyi1Q@mail.gmail.com>
 (Justin Capella's message of "Thu, 21 Feb 2019 16:58:02 -0800")
Message-ID: <87k1hmlpq8.fsf@kamboji.qca.qualcomm.com>
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
To: Justin Capella <justincapella@gmail.com>
Cc: ath10k@lists.infradead.org

Justin Capella <justincapella@gmail.com> writes:

> My apologies,
> I left out the important bit of the debug logs
> [ 1265.917324] ath10k_warn: 61 callbacks suppressed
> [ 1265.917330] ath10k_pci 0000:01:00.0: failed to parse chan info event: -71
>
> Possibly also relevant, i'm using country "US" I am aware that the fcc
> crda/regdom wasn't supported, but without the 802.11h option
> condigured in hostapd it had been working with older firmware.
>
> 7ce94a62264be94dc1c41ff5d0c8a19c7f0d3143 is the head of the master
> branch I'm using

What hardware and firmware version? That's very important. Preferably
copy the ath10k driver initialisation messages which contain all that.

Is this is regression, for example did an old firmware work? If yes,
which one did not have this problem?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
