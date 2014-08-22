Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKpvs-00084h-I5
 for ath10k@lists.infradead.org; Fri, 22 Aug 2014 14:35:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v8 2/4] ath10k: provide firmware crash info via debugfs
References: <20140821124705.27159.67898.stgit@potku.adurom.net>
 <20140821124907.27159.64620.stgit@potku.adurom.net>
 <1408626616.4388.0.camel@jlt4.sipsolutions.net>
 <877g21c3dd.fsf@kamboji.qca.qualcomm.com>
 <1408670355.4388.4.camel@jlt4.sipsolutions.net>
Date: Fri, 22 Aug 2014 17:34:43 +0300
In-Reply-To: <1408670355.4388.4.camel@jlt4.sipsolutions.net> (Johannes Berg's
 message of "Fri, 22 Aug 2014 03:19:15 +0200")
Message-ID: <87egw8a8zg.fsf@kamboji.qca.qualcomm.com>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Johannes Berg <johannes@sipsolutions.net> writes:

> On Thu, 2014-08-21 at 17:40 +0300, Kalle Valo wrote:
>
>> Heh, this has been a pretty long review period. To be honest I really
>> would like to get this just out of my hands :) And we do have a need for
>> this. When are you planning to implement that generic framework?
>
> Soon (TM). We need it, so really, I should do it soon.
>
>> What I understood is that this is already pretty close what you are
>> planning. Instead of creating a debugfs file of our own and allocating a
>> vmalloc buffer (which we do now), we would just use the buffer provided
>> by cfg80211 (or whatever component that would be) and use the sysfs file
>> the framework provides. So hopefully it would be pretty easy to convert
>> this to use your framework.
>
> I'm thinking now that since vmalloc space is limited on some
> architectures, we should just have a list of pages, but of course we
> could copy it there from vmalloc area.
>
> Anyway, yes, it should be fairly simple to convert - but is it worth it
> for you to have it now? Depends how you use it, I guess.

We really would have use for this, that's why I'm hesitant to wait more.
Even having this from an "unofficial" location would be a big help. If
it's ok for you, I would like to apply this once all review comments are
addressed. But naturally if you think it's better to wait, I will do
that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
