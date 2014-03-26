Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp1040.oracle.com ([156.151.31.81])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSmCV-00030L-TQ
 for ath10k@lists.infradead.org; Wed, 26 Mar 2014 11:40:56 +0000
Date: Wed, 26 Mar 2014 14:40:22 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] ath10k: add soft/hard firmware crash option to
 simulate_fw_crash
Message-ID: <20140326114021.GK7045@mwanda>
References: <20140313082431.10798.10888.stgit@potku.adurom.net>
 <87pplih81g.fsf@kamboji.qca.qualcomm.com>
 <20140321143737.GA5140@mwanda>
 <8738i64voh.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8738i64voh.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, Mar 25, 2014 at 08:52:14AM +0200, Kalle Valo wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
> >> drivers/net/wireless/ath/ath10k/debug.c:500 ath10k_write_simulate_fw_crash() error: strncmp() '"hard"' too small (5 vs 32)
> >> drivers/net/wireless/ath/ath10k/debug.c:497 ath10k_write_simulate_fw_crash() error: strncmp() '"soft"' too small (5 vs 32)
> >> 
> >> I wanted to use strncmp() instead of strcmp(), but I'm not sure what to
> >> do here. In my opinion it's guaranteed that the string "hard" is null
> >> terminated, so it shouldn't matter even if strlen("soft") (5) is less
> >> than sizeof(buf) (32), right? Or am I missing something here?
> >> 
> >
> > I am on vacation until next week.  I didn't think these particular
> > emails went out automatically.
> 
> Actually that's true. Fengguang's bot sends me a build report after
> every build and I saw these warnings in that report.
> 
> > Anyway, I have changed this in the latest smatch but it will take some
> > months for the kbuild bot to update.
> >
> > http://repo.or.cz/w/smatch.git/commitdiff/f10f27a7612c5b1e69b5d9080a0194d012beb6aa
> >
> > I'll take a closer look next week.
> 
> Thanks!

Actually I was just looking for why the email went out but you already
answered the question.  Eventually, this warning will go away when the
build-bot updates.  (It's sort of painful to update because Smatch
doesn't have stable releases).

regards,
dan carpenter


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
