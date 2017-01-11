Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRGTT-0004CJ-9j
 for ath10k@lists.infradead.org; Wed, 11 Jan 2017 10:49:49 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [1/2] ath10k: add accounting for the extended peer statistics
Date: Wed, 11 Jan 2017 10:49:20 +0000
Message-ID: <87y3yhoorc.fsf@kamboji.qca.qualcomm.com>
References: <992a4e2676037a06f482cdbe2d3d39e287530be5.1480974623.git.chunkeey@googlemail.com>
 <CAAd0S9DcCM9XQOihZx1sVf_1=S3VvDye4k1gEMgWEmNWDaBk5Q@mail.gmail.com>
 <20170103052827.GA8204@atheros-ThinkPad-T61>	<2769662.Qa6eUCGVkY@debian64>
In-Reply-To: <2769662.Qa6eUCGVkY@debian64> (Christian Lamparter's message of
 "Wed, 04 Jan 2017 21:06:20 +0100")
Content-Language: en-US
Content-ID: <53206BD6F955FA4CBD1B0136F1CA6C17@qualcomm.com>
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
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Christian Lamparter <chunkeey@googlemail.com> writes:

> Hello Shafi and Kalle,
>
> On Tuesday, January 3, 2017 10:58:27 AM CET Mohammed Shafi Shajakhan wrote:
>> On Fri, Dec 30, 2016 at 03:35:10PM +0100, Christian Lamparter wrote:
>> > On Thu, Dec 29, 2016 at 3:11 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> > > Christian Lamparter <chunkeey@googlemail.com> wrote:
>> > >> The 10.4 firmware adds extended peer information to the
>> > >> firmware's statistics payload. This additional info is
>> > >> stored as a separate data field and the elements are
>> > >> stored in their own "peers_extd" list.
>> > >>
>> > >> These elements can pile up in the same way as the peer
>> > >> information elements. This is because the
>> > >> ath10k_wmi_10_4_op_pull_fw_stats() function tries to
>> > >> pull the same amount (num_peer_stats) for every statistic
>> > >> data unit.
>> > >>
>> > >> Fixes: 4a49ae94a448faa ("ath10k: fix 10.4 extended peer stats update")
>> > >> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
>> > >
>> > > My understanding is that I should skip this patch 1. Please let me know if
>> > > I misunderstood. But I'm still plannning to apply patch 2.
>> > 
>> > I added Mohammed (I hope, he can reply to the open question when he
>> > returns), Since I'm not sure what he wants or not.
>> > 
>> > As far as I'm aware, the "extended" boolean serves no purpose
>> > because it was only used in once place in debugfs_sta which was
>> > removed in the patch. ( "ath10k_sta_update_stats_rx_duration"
>> > and "ath10k_sta_update_extd_stats_rx_duration" have been unified).
>> 
>> [shafi] We will wait for Kalle to review from the de-ferred stage
>> and get his opinion as well(regarding the design change).
>> I have no concerns as long this does not changes the existing behaviour.
>> thank you !
>
> Thank you Shafi for sticking around. I just fished your response to 
> "Re: [PATCH] ath10k: merge extended peer info data with existing peers info" [0].
> out of my spam-bucket. Kalle, please look if your copy of the mail got 
> flagged/deleted as well. Judging from the reply in this thread, I think you
> overlooked it as well? 

I think I just read the discussion to hastily as it was rather long,
sorry about that.

After really long or confusin discussions, just to help the maintainers
and also avoid miscommunication between participants, it's usually a
good idea to summarise the conclusion. If us maintainers need to figure
out the conclusion ourselves from a long discussion we are bound to make
mistakes, just like I did here.

So something like this would help me a lot:

"Kalle, please drop these patches. I need to work on these a bit more."

Or: 

"Kalle, me and John came to agreement about foo. So these should be good
to apply."

> After reading it, I think the previous post and the request to put the patch
> on wait was unnecessary. As of now, it seems to me that the open questions
> between us have been settled amically (so to speak). Kalle, do you have any
> concerns or can you put this in the next round then?

If you both are happy with the patch, I'm happy to take it :)

I actived the patch again in my queue by moving the state from Deferred
to New:

https://patchwork.kernel.org/patch/9461631/

If all goes well I'm expecting to apply it later this week.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
