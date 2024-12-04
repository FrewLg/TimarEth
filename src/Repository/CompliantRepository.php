<?php

namespace App\Repository;

use App\Entity\Compliant;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Compliant>
 *
 * @method Compliant|null find($id, $lockMode = null, $lockVersion = null)
 * @method Compliant|null findOneBy(array $criteria, array $orderBy = null)
 * @method Compliant[]    findAll()
 * @method Compliant[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CompliantRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Compliant::class);
    }

    //    /**
    //     * @return Compliant[] Returns an array of Compliant objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('c')
    //            ->andWhere('c.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('c.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Compliant
    //    {
    //        return $this->createQueryBuilder('c')
    //            ->andWhere('c.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
