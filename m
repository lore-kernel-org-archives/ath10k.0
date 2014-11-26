Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-f47.google.com ([209.85.192.47])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtlCv-0007bM-5N
 for ath10k@lists.infradead.org; Wed, 26 Nov 2014 22:37:10 +0000
Received: by mail-qg0-f47.google.com with SMTP id z60so2784254qgd.34
 for <ath10k@lists.infradead.org>; Wed, 26 Nov 2014 14:36:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <547525D4.5080701@candelatech.com>
References: <547525D4.5080701@candelatech.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Wed, 26 Nov 2014 14:36:16 -0800
Message-ID: <CAD1M061uAfCfCnnVY1bh6kCcXXZhwOOiyww5mkU8VkxGov9DwA@mail.gmail.com>
Subject: Re: IBSS mode is now supported by CT firmware.
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

On Tue, Nov 25, 2014 at 4:59 PM, Ben Greear <greearb@candelatech.com> wrote:
> I still cannot get WPA2 encryption to work, but open authentication
> seems to work fine.  I still have a good bit more testing to do.
> I cannot get ath9k to do encryption in IBSS mode either, so I
> probably am mis-configuring something.

I don't believe WPA2 is supported with adhoc (at least through
wpa_supplicant). However, WPA should be and while testing your
firmware, I found that it doesn't seem to work (They don't see each
other and thus don't associate).

I also found that, like the 999.x firmware, the rate's do not go
higher than 54mbit/s. Is this due to the firmware not advertising
proper rates or..?

As for throughput, I get 22mbps TCP, 27.6mbps UDP with no encryption.

- Pushpal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
