Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.linuxfoundation.org ([140.211.169.12])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBNPc-0002wU-CM
 for ath10k@lists.infradead.org; Wed, 25 Apr 2018 16:36:57 +0000
Date: Wed, 25 Apr 2018 18:36:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] firmware: some documentation fixes
Message-ID: <20180425163631.GB30492@kroah.com>
References: <20180425152617.GA5058@kroah.com>
 <20180425162540.11574-1-andresx7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180425162540.11574-1-andresx7@gmail.com>
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
To: Andres Rodriguez <andresx7@gmail.com>
Cc: arend.vanspriel@broadcom.com, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, hdegoede@redhat.com, mcgrof@kernel.org, alexdeucher@gmail.com, christian.koenig@amd.com, kvalo@codeaurora.org

On Wed, Apr 25, 2018 at 12:25:39PM -0400, Andres Rodriguez wrote:
> Including:
>  - Fixup outdated kernel-doc paths
>  - Slightly too short title underline
>  - Some typos
> 
> Signed-off-by: Andres Rodriguez <andresx7@gmail.com>
> ---
> 
> Hey Greg,
> 
> Here is the patch rebased on gregkh/driver-core-linus as requested.
> 
> Note that there is a patch by Hans de Goede <hdegoede@redhat.com> that contains
> some of the path fixes as well.
> 
> I also included an extra patch to fix the htmldocs build. I think we are in time
> to squash the fix into the offending commit.

We can't "squash" commits as our trees are not rebasable :)

thanks,

greg k-h

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
