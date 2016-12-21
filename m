Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJc7B-0001iy-0r
 for ath10k@lists.infradead.org; Wed, 21 Dec 2016 08:19:10 +0000
Received: by mail-oi0-x22a.google.com with SMTP id 128so7484779oig.0
 for <ath10k@lists.infradead.org>; Wed, 21 Dec 2016 00:18:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <ED4D0B085DB73545BAA27FA575E389E48101A2@MTK-SMS-XCH02.digi.com>
References: <ED4D0B085DB73545BAA27FA575E389E48101A2@MTK-SMS-XCH02.digi.com>
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Date: Wed, 21 Dec 2016 09:18:44 +0100
Message-ID: <CALhHN=qLK+ZBBmpA940g8hcXDcUhuXYxoTUVR6imjfLPZDCiLQ@mail.gmail.com>
Subject: Re: Can the ath10k driver support more than one MAC address?
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
To: "Gordon, Charles" <Charles.Gordon@digi.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 20 December 2016 at 23:35, Gordon, Charles <Charles.Gordon@digi.com> wrote:
> Hi,
>
> We are trying to use the ath10k driver in an embedded application.  We want to support a wifi client with multiple access points.  Does the ath10k driver support this?  Can the ath10k hardware and driver support multiple simultaneous MAC addresses?  Can it support multiple APs?
>
iw wlan0 interface add wlan0_1 type managed
ifconfig wlan0_1 hw ether <new_mac>

Depends on HW you have, some ath10k support single/multi channel concurrency.
You can check this using
iw phyX info - and next check valid combinations (channels <= 1 mean
SCC, so best if you have <= 2)

BR
Janusz

> Thanks for any information.
>
> Charles
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
