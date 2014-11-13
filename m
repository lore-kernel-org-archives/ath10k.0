Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x231.google.com ([2a00:1450:4010:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xovm5-0001A3-AG
 for ath10k@lists.infradead.org; Thu, 13 Nov 2014 14:53:29 +0000
Received: by mail-la0-f49.google.com with SMTP id ge10so13220432lab.22
 for <ath10k@lists.infradead.org>; Thu, 13 Nov 2014 06:53:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAJ-VmokLQsJb9qCPs3FY5FQfhBBhLoc99iyG1gnqP396WcKcSA@mail.gmail.com>
References: <CABfbVPKXg2HiVHuEy13s2_F=xw5nxyC7r0J229LsfRgGHySCMg@mail.gmail.com>
 <CAJ-VmokLQsJb9qCPs3FY5FQfhBBhLoc99iyG1gnqP396WcKcSA@mail.gmail.com>
Date: Thu, 13 Nov 2014 09:53:06 -0500
Message-ID: <CABfbVPLJaHo3nde3biMYQq+RXjy2WKz2brFABMkFQ7DPsJw2oA@mail.gmail.com>
Subject: Re: Ath10k leaves AR9880 in a state that will not enumerate again
 when CPU warm booted
From: David Dailey <daileycrew@gmail.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Yes, we have a known platform issue I mentioned where we don't assert
any hw reset line to the PCIe slot during warm boot.  It does assert
on cold boot.  Sounds like this issue is the same one you describe and
unique to QCA parts.  I was hoping to get lucky and someone would know
how to re-init the PCI block via software before reboot as a work
around.  Thanks for the info.

Dave

On Wed, Nov 12, 2014 at 4:43 PM, Adrian Chadd <adrian@freebsd.org> wrote:
> Is the length / number of card resets during a warm boot differ to cold boot?
>
> There's a known behavioural quirk where if the reset line isn't held
> for long enough or there's too short a gap between one and another
> reset assertion, the NIC doesn't fully initialise right.
>
>
>
> -a
>
>
> On 12 November 2014 13:34, David Dailey <daileycrew@gmail.com> wrote:
>> I discovered that this issue seems to follow at least 2 different
>> chipsets (AR9880 and AR9890) but doesn't happen with at least two BCM
>> chipsets.  And the enumeration failing after a warm boot doesn't
>> depend on ath10k loading at all.  Even with the module not present on
>> the system, the device doesn't enumerate after cold boot.  So it
>> appears this is something unique to the PCIe core on Atheros, not
>> ath10k.  I guess the only hope would be if somehow the unload of the
>> driver could restore the chipset back to a state where it would
>> enumerate again, but I don't have information on the chipset at that
>> level.
>>
>> Dave
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
