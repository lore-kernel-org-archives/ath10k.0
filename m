Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFJLZ-0006M6-OL
 for ath10k@lists.infradead.org; Mon, 07 Sep 2020 15:46:22 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: CVE-2020-3702: Firmware updates for ath9k and ath10k chips
References: <20200810090126.mtu3uocpcjg5se5e@pali>
 <20200812083600.6zxdf5pfktdzggd6@pali> <87lfik1av8.fsf@toke.dk>
 <20200812092334.GA17878@w1.fi>
 <20200829114833.GC574887@tuxmachine.localdomain>
Date: Mon, 7 Sep 2020 15:46:18 +0000
In-Reply-To: <20200829114833.GC574887@tuxmachine.localdomain> (Baptiste
 Jonglez's message of "Sat, 29 Aug 2020 13:48:33 +0200")
Message-ID: <01010174693f1d4b-1239b285-00f1-48af-af8e-2feba23e115f-000000@us-west-2.amazonses.com>
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
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Cc: openwrt-devel@lists.openwrt.org, ath10k@lists.infradead.org

Baptiste Jonglez <baptiste@bitsofnetworks.org> writes:

> Hi,
>
> Cross-posting to openwrt-devel because we are backporting the necessary fixes.
>
> On 12-08-20, Jouni Malinen wrote:
>> On Wed, Aug 12, 2020 at 11:17:47AM +0200, Toke H?iland-J?rgensen wrote:
>> > Pali Roh?r <pali at kernel.org> writes:
>> > > Could somebody react and provide some details when fixes would be
>> > > available for ath9k and ath10k Linux drivers? And what is current state
>> > > of this issue for Linux?
>> > >
>> > > I'm looking at ath9k and ath10k git trees [1] [2] [3] and I do not see
>> > > there any change which could be related to CVE-2020-3702.
>> > 
>> > How about these, from March:
>> > 
>> > a0761a301746 ("mac80211: drop data frames without key on encrypted links")
>> > ce2e1ca70307 ("mac80211: Check port authorization in the
>> > ieee80211_tx_dequeue() case")
>> > b16798f5b907 ("mac80211: mark station unauthorized before key removal")
>> 
>> Those cover most of the identified issues for drivers using mac80211
>> (e.g., ath9k and ath10k; though, I don't remember whether I actually
>> ever managed to reproduce this with ath10k in practice). I have couple
>> of additional ath9k-specific patches that cover additional lower layer
>> paths for this. I hope to get those out after confirming they work with
>> the current kernel tree snapshot.
>
> I could find linux-stable backports for ce2e1ca70307 and b16798f5b907, but
> not for a0761a301746.  Is it intended?  From the commit message, it looks
> like it does fix an important issue.
>
> Also, for the sake of completeness, this subsequent commit is also related
> to CVE-2020-3702 (and already backported):
>
> 5981fe5b0529 ("mac80211: fix misplaced while instead of if")

I think you should ask the stable to also take commit a0761a301746, most
likely they just missed it by accident.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
