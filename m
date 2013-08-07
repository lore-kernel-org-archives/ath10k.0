Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6xiy-0005m7-Vi
 for ath10k@lists.infradead.org; Wed, 07 Aug 2013 07:00:02 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: setup peer UAPSD flag correctly
References: <1375853036-2418-1-git-send-email-janusz.dziedzic@tieto.com>
Date: Wed, 7 Aug 2013 09:59:28 +0300
In-Reply-To: <1375853036-2418-1-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Wed, 7 Aug 2013 07:23:56 +0200")
Message-ID: <87li4e6l67.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> Setup UAPSD peer rate control (FW flag)
> correctly.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

This doesn't answer the question "Why?". I have now added a section in
the wiki about what the commit log should contain. Hopefully that helps.

Submitting patches

Send patches to the mailing lists below. Kalle Valo reviews the patches
within the next few days and, if they are ok, commits them to ath.git.

To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Preferably use ath.git master as the baseline for patches. Other trees
can be used as well, but then the chances of conflicts are higher.

Guidelines for patches:

* MUST be compiler warning free.

* MUST be sparse warning free.

* Commit log MUST not be empty.

* The commit log MUST answer the question "Why?":

  * Describe the motivation behind the bug.

  * How does it change the functionality from user's point of view?

  * Does it fix a bug? If it does, please describe the bug (doesn't need
    to be long). Also if there's a public bug report add a link to the
    bug report.

* If others have reported the issue commit log SHOULD use Reported-by:
  and Tested-by: tags.

* SHOULD be checkpatch clean:

  * FIXME: add checkpatch example with correct arguments

* Patches SHOULD be sent with git send-email tool.

* Patchsets SHOULD contain no more than 12 patches.

The terminology is from http://www.ietf.org/rfc/rfc2119.txt

http://wireless.kernel.org/en/users/Drivers/ath10k#Submitting_patches

Please comment.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
