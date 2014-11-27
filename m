Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x236.google.com ([2a00:1450:400c:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtnWL-00068L-Fb
 for ath10k@lists.infradead.org; Thu, 27 Nov 2014 01:05:22 +0000
Received: by mail-wg0-f54.google.com with SMTP id l2so5180706wgh.27
 for <ath10k@lists.infradead.org>; Wed, 26 Nov 2014 17:04:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAD1M061uAfCfCnnVY1bh6kCcXXZhwOOiyww5mkU8VkxGov9DwA@mail.gmail.com>
References: <547525D4.5080701@candelatech.com>
 <CAD1M061uAfCfCnnVY1bh6kCcXXZhwOOiyww5mkU8VkxGov9DwA@mail.gmail.com>
Date: Thu, 27 Nov 2014 09:04:59 +0800
Message-ID: <CAEFj986B15pFo2WY_2x0VwEXBEBy+j0-nff2-B=Ff=qP66iP_w@mail.gmail.com>
Subject: Re: IBSS mode is now supported by CT firmware.
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
To: Pushpal Sidhu <psidhu@gateworks.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

On Thu, Nov 27, 2014 at 6:36 AM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
> On Tue, Nov 25, 2014 at 4:59 PM, Ben Greear <greearb@candelatech.com> wrote:
>> I still cannot get WPA2 encryption to work, but open authentication
>> seems to work fine.  I still have a good bit more testing to do.
>> I cannot get ath9k to do encryption in IBSS mode either, so I
>> probably am mis-configuring something.
>
> I don't believe WPA2 is supported with adhoc (at least through
> wpa_supplicant). However, WPA should be and while testing your
> firmware, I found that it doesn't seem to work (They don't see each
> other and thus don't associate).
>
> I also found that, like the 999.x firmware, the rate's do not go
> higher than 54mbit/s. Is this due to the firmware not advertising
> proper rates or..?

Are you joining the adhoc network in non-HT mode? Anyway, even if you
use HT mode, the rate control is not working for 999.x firmware and
always stuck at 6Mbps as far as I know.

-----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
