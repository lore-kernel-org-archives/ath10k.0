Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvL5v-0000gR-4a
 for ath10k@lists.infradead.org; Thu, 21 May 2015 07:40:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] amth10k: fix promisc handling
References: <1431434736-7077-1-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQ=dzJS447Gx+XAXPT6gZDDKZ__6scbxe0QC-iMA47bZmQ@mail.gmail.com>
Date: Thu, 21 May 2015 10:40:04 +0300
In-Reply-To: <CA+BoTQ=dzJS447Gx+XAXPT6gZDDKZ__6scbxe0QC-iMA47bZmQ@mail.gmail.com>
 (Michal Kazior's message of "Thu, 21 May 2015 07:40:38 +0200")
Message-ID: <874mn68jl7.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, "John W. Linville" <linville@tuxdriver.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Adding John as this involved wireless-testing

Michal Kazior <michal.kazior@tieto.com> writes:

> On 12 May 2015 at 14:45, Michal Kazior <michal.kazior@tieto.com> wrote:
>> Patch df1404650ccb ("mac80211: remove support for
>> IFF_PROMISC") removed promiscuous flag propagation
>> to drivers.
>>
>> However the patch was designed against ath10k
>> without 548462133d98 ("ath10k: fix interrupt
>> storm").
>>
>> After merge the code drifted into being no longer
>> correct and due to monitor vdev being
>> overzealously started caused IBSS to crash on
>> 999.999.0.636 for QCA988X (this firmware revision
>> is known to have issues with monitor vdev).
>>
>> This patch keeps expectations of commit
>> 548462133d98 (i.e. reduce irq storm by not
>> enabling monitor vdev for AP) and doesn't break
>> existing (known) setups that imply promiscuous
>> mode on network interfaces.
>>
>> Contrary to what it looks like 548462133d98
>> functionality is not reverted since the intention
>> was a subset of what df1404650ccb did.
>>
>> Fixes: c17c997d5613 ("Merge git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next")
>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>
> Apparently this also fixes some weird issues with qca6174 hw2.1 notably:
>  - ath10k causing disconnecting of other devices in a BSS
>  - random Fw crashes
>
> Both problems started to happen because c17c997d5613 enabled monitor
> vdev by default on STA interfaces. It seems that qca6174 hw2.1
> firmware has issues similar to those of qca988x 999.999.0.636
> regarding monitor vdev opration.
>
> Also, I've made a typo in the subject.
>
> I'll post v2 with subject fixed and extended commit log later.

Keep in mind that c17c997d5613 is actually from wireless-testing.git
which means that it will never go to wireless-drivers-next.git nor to
net-next.git. So the merge conflict bug is purely in
wireless-testing.git and in master branch of ath.git (but not in
ath-next branch!).

I think John should apply your v2 patch once you send it. But if you
have something which should be fixed in ath-next remember to send that
in a separate patch so that I can apply that directly to ath-next.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
