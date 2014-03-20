Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQVwc-0003bH-GP
 for ath10k@lists.infradead.org; Thu, 20 Mar 2014 05:55:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Compilation ath10k
References: <EE97821C81277E459BEA5C6384C6F241012D6392146F@srvexch01.SODIELEC.local>
Date: Thu, 20 Mar 2014 07:54:43 +0200
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012D6392146F@srvexch01.SODIELEC.local>
 (Vu Hai NGUYEN's message of "Wed, 19 Mar 2014 18:27:09 +0100")
Message-ID: <871txxh0t8.fsf@kamboji.qca.qualcomm.com>
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: ath10k <ath10k@lists.infradead.org>

Hi,

Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> writes:

> I'm new to the driver ath10k. Is there any way to compile only the
> driver ath10k in the directory /ath / drivers / net / wireless / ath /
> ath10k ? I was able to compile all the project by the command "make
> menuconfig" in the directory /ath but it appears a menu of
> configuration only. So I have to config that menu in other to compile
> the driver ath10k? or I can compile separately the driver?

I think this is a case of an XY problem. It's easier to help when you
describe the actual problem instead of the solution which you think will
help.

http://meta.stackoverflow.com/questions/66377/what-is-the-xy-problem

I'm guessing that your problem is that you want to run latest ath10k on
an older kernel like 3.5. For that backports is the best solution:

https://backports.wiki.kernel.org/index.php/Main_Page

If I guessed wrong, please describe why you want to compile the driver
separately.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
