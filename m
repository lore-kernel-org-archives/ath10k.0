Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSLE1-0007HF-SI
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 06:52:42 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: add soft/hard firmware crash option to
 simulate_fw_crash
References: <20140313082431.10798.10888.stgit@potku.adurom.net>
 <87pplih81g.fsf@kamboji.qca.qualcomm.com>
 <20140321143737.GA5140@mwanda>
Date: Tue, 25 Mar 2014 08:52:14 +0200
In-Reply-To: <20140321143737.GA5140@mwanda> (Dan Carpenter's message of "Fri, 
 21 Mar 2014 17:37:38 +0300")
Message-ID: <8738i64voh.fsf@kamboji.qca.qualcomm.com>
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
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

>> drivers/net/wireless/ath/ath10k/debug.c:500 ath10k_write_simulate_fw_crash() error: strncmp() '"hard"' too small (5 vs 32)
>> drivers/net/wireless/ath/ath10k/debug.c:497 ath10k_write_simulate_fw_crash() error: strncmp() '"soft"' too small (5 vs 32)
>> 
>> I wanted to use strncmp() instead of strcmp(), but I'm not sure what to
>> do here. In my opinion it's guaranteed that the string "hard" is null
>> terminated, so it shouldn't matter even if strlen("soft") (5) is less
>> than sizeof(buf) (32), right? Or am I missing something here?
>> 
>
> I am on vacation until next week.  I didn't think these particular
> emails went out automatically.

Actually that's true. Fengguang's bot sends me a build report after
every build and I saw these warnings in that report.

> Anyway, I have changed this in the latest smatch but it will take some
> months for the kbuild bot to update.
>
> http://repo.or.cz/w/smatch.git/commitdiff/f10f27a7612c5b1e69b5d9080a0194d012beb6aa
>
> I'll take a closer look next week.

Thanks!

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
