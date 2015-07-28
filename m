Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK7fd-0006b3-52
 for ath10k@lists.infradead.org; Tue, 28 Jul 2015 16:24:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: remove NULL ptr deref in variable init of
 ath10k_monitor_vdev_start
References: <1438024935-3946-1-git-send-email-linville@tuxdriver.com>
 <55B70EEF.9070205@qti.qualcomm.com>
 <20150728143124.GB17081@tuxdriver.com>
Date: Tue, 28 Jul 2015 19:23:25 +0300
In-Reply-To: <20150728143124.GB17081@tuxdriver.com> (John W. Linville's
 message of "Tue, 28 Jul 2015 10:31:25 -0400")
Message-ID: <87a8ug8d4y.fsf@kamboji.qca.qualcomm.com>
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
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

"John W. Linville" <linville@tuxdriver.com> writes:

> On Tue, Jul 28, 2015 at 10:41:11AM +0530, Vasanthakumar Thiagarajan wrote:
>> On Tuesday 28 July 2015 12:52 AM, John W. Linville wrote:
>> >In ath10k_monitor_vdev_start, chandef is initialized to NULL and then
>> >channel is immediately thereafter initialized to chandef->chan (i.e.
>> >NULL->chan).  This appears to be some sort of cut-n-paste error, since
>> >the same assignment is done later (i.e. after chandef has been properly
>> >assigned to a non-NULL value).  So, let's just remove this "brown paper
>> >bag" typo/thinko... :-)
>> >
>> >Coverity CID #1309505
>> >
>> >Signed-off-by: John W. Linville <linville@tuxdriver.com>

[...]

>> There is a similar change integrated recently,
>> https://github.com/kvalo/ath/commit/19be9e9a7ac7e6050eab426283d2a87593cf6e82
>
> OK.  I don't see much point in the NULL assignment for channel, but the main
> point is to avoide the chandef->chan part.

Yeah, that was an oversight in my review. Want to send a patch to fix
that? :)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
